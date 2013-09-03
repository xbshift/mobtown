class BulkSignupsController < ApplicationController
  before_filter :authenticate

  def new
    @bulk_signup = BulkSignup.new
    @passes = Pass.active.sort_by{|p| p.passable_type}.reverse.sort_by{|p| [p.passable.name, -p.price]}
  end

  def create
    @name = params[:bulk_signup][:name]
    @email = params[:bulk_signup][:email]
    @passes = params[:pass_ids].collect{|p| Pass.find(p)}
    @params = params

    @registrations = @passes.each.collect{|p| p.registrations.build}
    @registrations.each do |r|
      r.amount_paid = params[:amount_paid][r.pass.id.to_s]
      r.how_paid = params[:bulk_signup][:how_paid]
      r.name = @name
      r.email = @email
    end
    @total = @registrations.collect{|r| r.amount_paid.to_f}.sum
    if not @registrations.each(&:save)
      render :action => 'new'
    end
    @registrations.each(&:backup)
    if params[:opt_in] == '1'
      @registrations.first.add_to_madmimi_email_list
    end
  end

end
