class DanceClassesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]

  def new
    @dance_class = DanceClass.new
 
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @dance_class }
    end
  end

  def create
    @dance_class = DanceClass.new(params[:dance_class])
 
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
    @category_id = params.has_key?(:category) ? params[:category] : Category.first
    @category = Category.find(@category_id)
    @dance_classes = @category.dance_classes
    if params.has_key?('id')
      @tab = '[href="#tab-' + params[:id] + '"]'
    else
      @tab = ':first'
    end
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @dance_classes }
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
                      :notice => 'Dance Class was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @dance_class.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @category = DanceClass.find(params[:id]).category
    @dance_classes = @category.dance_classes
    @tab = '[href="#tab-' + params[:id] + '"]'

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @dance_classes }
    end
  end

  def destroy
    @dance_class = DanceClass.find(params[:id])
    @dance_class.destroy
 
  respond_to do |format|
    format.html { redirect_to dance_classes_url }
    format.json { head :no_content }
  end
end
end
