class PassesController < ApplicationController
  before_filter :authenticate

  def index
    @bulk_signup = BulkSignup.new
    @passes = Pass.active.sort_by{|p| p.passable_type}.reverse.sort_by{|p| [p.passable.name, -p.price]}
  end

  def bulk_signup
    @name = params[:name]
    @email = params[:email]
    @passes = params[:pass_ids].collect{|p| Pass.find(p)}
    @params = params

    @registrations = @passes.each.collect{|p| p.registrations.build}
    @registrations.each do |r|
      r.amount_paid = params[:amount_paid][r.pass.id.to_s]
      r.how_paid = params[:how_paid]
      r.name = @name
      r.email = @email
    @registrations.each(&:save)
    @total = @registrations.collect{|r| r.amount_paid.to_f}.sum
    end
  end

end
