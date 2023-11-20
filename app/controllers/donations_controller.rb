# frozen_string_literal: true

class DonationsController < ApplicationController
  require 'stripe'
  http_basic_authenticate_with name: 'dhh', password: 'secret', except: [:index]

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)

    # Charge the user's card
    Stripe::Charge.create({
                            amount: @donation.amount * 100, # convert to cents
                            currency: 'usd',
                            source: params[:stripe_token],
                            description: 'Donation'
                          })

    @donation.save

    flash[:success] = 'Thank you for your donation!'
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :new
  end

  private

  def donation_params
    params.require(:donation).permit(:first_name, :last_name, :email, :amount)
  end
end
