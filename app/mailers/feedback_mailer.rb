class FeedbackMailer < ApplicationMailer
  default from: 'notifications@chesedtrain.com'

  def new_feedback
    @feedback = params[:feedback]
    mail(
      to: 'mendylevy@gmail.com',
      reply_to: @feedback.email.presence || 'notifications@chesedtrain.com',
      subject: "[Chesed Train] New #{@feedback.display_category} submitted"
    )
  end
end
