class ChargesController < ApplicationController

  def new
  end

  def create
    pass = Pass.find(params[:pass_id])
 
    customer = Stripe::Customer.create(
      :email => 'hello', # params[:registration][:email],
      :description => 'yep', #params[:registration][:name],
      :card  => params[:stripeToken]
    )

    @price = pass.price
    cents = (pass.price*100).to_i

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => cents,
      :description => 'asdf', # pass.event.title + ' ' + pass.name,
      :currency    => 'usd'
    )

    registration = pass.registrations.create(params[:registration])
    registration.amount_paid = @price
    registration.how_paid = 'Stripe'
    registration.save

    rescue Stripe::CardError => e
      flash[:error] = e.message
    end


  end
