class DonationsController < ApplicationController
  before_action :set_event, only: [:new, :create, :setup, :update_setup]

  def new
    @event = Event.friendly.find(params[:id])
  end

  def create
    amount = params[:amount].to_i
    
    if amount <= 0
      redirect_to donate_chesed_train_path(@event), alert: 'Please enter a valid amount'
      return
    end

    # Create Stripe checkout session
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: "Donation for #{@event.name}",
            description: "Donation to help #{@event.recipent_name}"
          },
          unit_amount: amount * 100 # Convert to cents
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: donation_success_url(event_id: @event.id, amount: amount),
      cancel_url: donate_chesed_train_url(@event),
      metadata: {
        event_id: @event.id,
        donor_name: params[:donor_name],
        donor_email: params[:donor_email]
      }
    )

    redirect_to session.url, allow_other_host: true
  rescue Stripe::StripeError => e
    redirect_to donate_chesed_train_path(@event), alert: "Payment error: #{e.message}"
  end

  def setup
    unless current_user && @event.owner == current_user
      redirect_to chesed_train_path(@event), alert: 'Only the organizer can set up donations'
      return
    end
  end

  def update_setup
    unless current_user && @event.owner == current_user
      redirect_to chesed_train_path(@event), alert: 'Only the organizer can set up donations'
      return
    end

    goal = params[:donation_goal].to_i
    if goal > 0
      @event.update(donation_goal: goal, donations_enabled: true, total_donated: 0)
      redirect_to chesed_train_path(@event), notice: 'Donation fund has been set up!'
    else
      redirect_to setup_donation_chesed_train_path(@event), alert: 'Please select a goal amount'
    end
  end

  def success
    event_id = params[:event_id]
    amount = params[:amount].to_i
    
    if event_id.present? && amount > 0
      event = Event.find(event_id)
      event.increment!(:total_donated, amount)
      @event = event
      @amount = amount
    else
      redirect_to root_path, alert: 'Invalid donation'
    end
  end

  private

  def set_event
    @event = Event.friendly.find(params[:id])
  end

  def donation_success_url(params)
    "#{request.base_url}/donation-success?event_id=#{params[:event_id]}&amount=#{params[:amount]}"
  end
end
