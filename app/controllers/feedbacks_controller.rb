class FeedbacksController < ApplicationController
  LINK_SPAM = /<a\s|href\s*=|\[url/i

  def create
    return silently_drop('honeypot') if params.dig(:feedback, :website).present?
    return silently_drop('html link') if params.dig(:feedback, :message).to_s.match?(LINK_SPAM)
    return silently_drop('recaptcha') unless verify_recaptcha

    begin
      user = (session[:user_id] && User.find_by(id: session[:user_id])) || nil
      user = nil if user&.guest?

      @feedback = Feedback.new(feedback_params)
      @feedback.user = user if user
      @feedback.email = user.email_address if @feedback.email.blank? && user

      if @feedback.save
        # Fire-and-forget email; never let it break the response
        begin
          FeedbackMailer.with(feedback: @feedback).new_feedback.deliver_now
        rescue => e
          Rails.logger.error("FeedbackMailer error: #{e.class.name} #{e.message}")
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
    rescue => e
      Rails.logger.error("FeedbacksController#create error: #{e.class.name} #{e.message}\n#{e.backtrace&.first(5)&.join("\n")}")
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, alert: 'Sorry, something went wrong. Please try again.' }
        format.json { render json: { ok: false, errors: ['Sorry, something went wrong. Please try again.'] }, status: :internal_server_error }
      end
    end
  end

  private

  def handle_unverified_request
    silently_drop('csrf')
  end

  def silently_drop(reason)
    Rails.logger.info("[feedback spam] dropped (#{reason}) from #{request.remote_ip}")
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Thanks! Your message has been sent.' }
      format.json { render json: { ok: true, message: 'Thanks! Your message has been sent.' } }
    end
  end

  def feedback_params
    params.require(:feedback).permit(:category, :name, :email, :message, :page_url)
  end
end
