class FeedbacksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create], if: -> { request.format.json? }

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user if current_user && !current_user.try(:guest?)
    @feedback.email = current_user.email_address if @feedback.email.blank? && current_user && !current_user.try(:guest?)

    if @feedback.save
      begin
        FeedbackMailer.with(feedback: @feedback).new_feedback.deliver_later
      rescue => e
        Rails.logger.error("FeedbackMailer error: #{e.message}")
      end

      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: 'Thanks! Your message has been sent.' }
        format.json { render json: { ok: true, message: 'Thanks! Your message has been sent.' } }
      end
    else
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, alert: "Could not send: #{@feedback.errors.full_messages.join(', ')}" }
        format.json { render json: { ok: false, errors: @feedback.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:category, :name, :email, :message, :page_url)
  end
end
