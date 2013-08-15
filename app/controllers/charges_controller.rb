class ChargesController < ApplicationController
  respond_to :html, :js, :json

  def new
    @name = params[:registration][:name]
    @email = params[:registration][:email]
    @student = params[:registration][:student]
    @pass_id = params[:pass_id]
    @opt_in = params[:opt_in]
  end

  def create
    @pass = Pass.find(params[:pass_id])
    
    student = params[:registration][:student]
    description = params[:registration][:name]
    if student == 'true'
      description += ' (student)'
    end
 
    customer = Stripe::Customer.create(
      :email => params[:registration][:email],
      :description => description,
      :card  => params[:stripeToken]
    )
   
    @amount = student == 'true' ? @pass.student_price : @pass.price
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
    if params[:opt_in] == 'true'
      registration.add_to_madmimi_email_list
    end
    registration.backup

    respond_to do |format|
      format.js
    end

  end
end
