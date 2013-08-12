class PassesController < ApplicationController
  before_filter :authenticate

  def index
    @passes = Pass.active.sort_by{|p| p.passable_type}.reverse.sort_by{|p| [p.passable.name, -p.price]}
  end

  def bulk_signup
    @name = params[:name]
    @email = params[:email]
    @passes = params[:pass_ids].collect{|p| Pass.find(p)}

    @registrations = @passes.each.collect{|p| p.registrations.build}
    @registrations.each do |r|
      r.amount_paid = params[:amount_paid][r.pass.id.to_s]
      r.how_paid = 'Card'
      r.name = @name
      r.email = @email
    @registrations.each(&:save)
    end
  end

end
