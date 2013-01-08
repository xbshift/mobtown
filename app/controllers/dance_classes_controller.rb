class DanceClassesController < ApplicationController
  def new
  end

  def index
  @dance_classes = DanceClass.all
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @dance_classes }
    end
  end

  def lindy
    @dance_classes = DanceClass.find_all_by_category('lindy')
    respond_to do |format|
      format.html  # lindy.html.erb
      format.json  { render :json => @dance_classes }
    end
  end

  def swing 
    @dance_classes = DanceClass.find_all_by_category('swing')
    respond_to do |format|
      format.html  # swing.html.erb
      format.json  { render :json => @dance_classes }
    end
  end

  def salsa
    @dance_classes = DanceClass.find_all_by_category('salsa')
    respond_to do |format|
      format.html  # salsa.html.erb
      format.json  { render :json => @dance_classes }
    end
  end

  def westcoast
    @dance_classes = DanceClass.find_all_by_category('west coast')
    respond_to do |format|
      format.html  # westcoast.html.erb
      format.json  { render :json => @dance_classes }
    end
  end

  def bellydancing
    @dance_classes = DanceClass.find_all_by_category('belly dancing')
    respond_to do |format|
      format.html  # bellydancing.html.erb
      format.json  { render :json => @dance_classes }
    end
  end
end
