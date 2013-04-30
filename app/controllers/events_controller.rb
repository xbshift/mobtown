class EventsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]

  include EventHelper
  include IceCube

  def index
    @tonight = Occurrence.tonight
    @this_week = Occurrence.between(Date.tomorrow, Date.today.end_of_week)
    @beyond = Occurrence.between(Date.today.end_of_week + 1.day, Date.today + 60.days) 
  end

  def manage
    @events = Event.all
  end

  def new
    @event = Event.new
    @event.occurrences.build
  end

  def create
    @event = Event.create(params[:event])
 
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :action => "new"
    end
  end

  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
    end
  end

  def edit
    @event = Event.find(params[:id])
    @event.occurrences.build
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html  { redirect_to(@event,
                      :notice => 'Event was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @event.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to manage_events_url }
      format.json { head :no_content }
    end
  end
end
