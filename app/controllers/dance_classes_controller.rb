class DanceClassesController < ApplicationController
  def new
  end

  def index
  @dance_classes = DanceClass.all
 
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @post }
    end
  end

  def lindy
    @dance_classes = DanceClass.find_all_by_category('lindy')

    respond_to do |format|
      format.html  # lindy.html.erb
      format.json  { render :json => @post }
    end
  end
end
