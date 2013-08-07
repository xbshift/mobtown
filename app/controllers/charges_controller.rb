class ChargesController < ApplicationController

  def new
  end

  def create
    @amount = (params[:amount].to_f*100).to_i
 
    customer = Stripe::Customer.create(
      :email => params[:registrant_email],
      :description => params[:registrant_name],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => params[:pass_summary],
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
    end
  end
