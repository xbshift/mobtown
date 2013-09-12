class StaffController < ApplicationController
  def new
    @staff = Staff.new
  end
 
  def create
    Staff.create(params[:staff])
    redirect_to staff_index_path
  end

  def index
    @staff = Staff.all
  end

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])
    @staff.update_attributes(params[:staff])
    redirect_to staff_index_path
  end

  def destroy
  end
end
