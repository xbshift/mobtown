class DanceClassesController < ApplicationController
  def new
  end

  def index
    @all_dance_classes = DanceClass.all
    params[:category] = 'lindy' if not params.has_key?('category')
      @dance_classes = DanceClass.find_all_by_category(params[:category])
    if params.has_key?('id')
      @tab = '[href="#tab' + params[:id] + '"]'
    else
      @tab = ':first'
    end
    @category = params[:category]
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @dance_classes }
    end
  end
end
