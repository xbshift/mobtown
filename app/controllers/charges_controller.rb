class ChargesController < ApplicationController
  respond_to :html, :js, :json

  def new
    @name = params[:registration][:name]
    @email = params[:registration][:email]
    @pass_id = params[:pass_id]
  end

  def create
    @pass = Pass.find(params[:pass_id])
 
    customer = Stripe::Customer.create(
      :email => params[:registration][:email],
      :description => params[:registration][:name],
      :card  => params[:stripeToken]
    )

    @amount = @pass.price
    cents = (@amount*100).to_i

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => cents,
      :description => @pass.passable.name + ' ' + @pass.name,
      :currency    => 'usd'
    )

    registration = @pass.registrations.create(params[:registration])
    registration.amount_paid = @amount
    registration.how_paid = 'Stripe'
    registration.save

    respond_to do |format|
      format.js
    end

  end
end
