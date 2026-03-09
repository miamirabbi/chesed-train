class DonationMailer < ApplicationMailer
  def donation_received(user, event, amount, donor_name = nil)
    @user = user
    @event = event
    @amount = amount
    @donor_name = donor_name || "Anonymous"
    
    mail(to: user.email_address, subject: "New Donation Received for #{event.name}!")
  end
end
