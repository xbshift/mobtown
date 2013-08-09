class RegistrationsController < ApplicationController

  def new
  end

  def create
  end

  def index
    @pass = Pass.find(params[:pass_id])
    @event = Event.find(@pass.event_id)
    @registrations = @pass.registrations
  end

end
