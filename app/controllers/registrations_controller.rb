class RegistrationsController < ApplicationController
  before_filter :authenticate, :except => [:create, :new, :checkout, :charge]
  respond_to :html, :js, :json

  def new
  end

  def checkout
    @name = params[:registration][:name]
    @email = params[:registration][:email]
    @student = params[:registration][:student]
    @pass_id = params[:pass_id]
    @pass = Pass.find(@pass_id)
    @opt_in = params[:opt_in]
    @amount = @student == 'true' ? @pass.student_price : @pass.price
    @cents = (@amount*100).to_i

    respond_to do |format|
      format.js
    end
  end

  def charge
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

  def create
    @params = params
    @pass = Pass.find(params[:pass_id])
    @email = params[:registration][:email]
    @opt_in = params[:opt_in]? 'true' : 'false'
    @name = params[:registration][:name]
    @student = params[:registration][:student]
    @amount = @student == 'true' ? @pass.student_price : @pass.price
    @cents = (@amount*100).to_i
    respond_to do |format|
      format.js
    end
  end

  def index
    @pass = Pass.find(params[:pass_id])
    @registrations = @pass.registrations.sort_by{|r| r.created_at}
  end

  def void
    @registration = Registration.find(params[:id])
    @registration.void = true
    @registration.save
  end

  def unvoid
    @registration = Registration.find(params[:id])
    @registration.void = false
    @registration.save
  end 

end
