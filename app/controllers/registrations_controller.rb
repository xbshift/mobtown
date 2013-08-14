class RegistrationsController < ApplicationController
  before_filter :authenticate

  def new
  end

  def create
    @params = params
    @pass = Pass.find(params[:pass_id])
    @email = params[:registration][:email]
    @name = params[:registration][:name]
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
