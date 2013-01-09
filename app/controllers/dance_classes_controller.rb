class DanceClassesController < ApplicationController
  def new
    @dance_class = DanceClass.new
 
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @dance_class }
    end
  end

def create
  @dance_class = DanceClass.new(params[:post])
 
  respond_to do |format|
    if @dance_class.save
      format.html  { redirect_to(@dance_class,
                    :notice => 'Class was successfully created.') }
      format.json  { render :json => @dance_class,
                    :status => :created, :location => @dance_class }
    else
      format.html  { render :action => "new" }
      format.json  { render :json => @dance_class.errors,
                    :status => :unprocessable_entity }
    end
  end
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

def edit
  @dance_class = DanceClass.find(params[:id])
end

def update
  @dance_class= DanceClass.find(params[:id])
 
  respond_to do |format|
    if @dance_class.update_attributes(params[:dance_class])
      format.html  { redirect_to(@dance_class,
                    :notice => 'Post was successfully updated.') }
      format.json  { head :no_content }
    else
      format.html  { render :action => "edit" }
      format.json  { render :json => @dance_class.errors,
                    :status => :unprocessable_entity }
    end
  end
end

def show
  @dance_class = DanceClass.find(params[:id])
 
  respond_to do |format|
    format.html  # show.html.erb
    format.json  { render :json => @dance_class }
  end
end
