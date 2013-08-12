class RegistrationsController < ApplicationController
  before_filter :authenticate

  def new
  end

  def create
  end

  def index
    @pass = Pass.find(params[:pass_id])
    @event = Event.find(@pass.passable_id)
    @registrations = @pass.registrations
  end

end
