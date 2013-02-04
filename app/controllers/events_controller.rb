require 'ice_cube'

class EventsController < ApplicationController
  include EventHelper

  def index
    @events = Event.all
    @events = expand_events(@events, 60.days)

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @events }
    end
  end

  def new
    @event = Event.new
 
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @event }
    end
  end

  def create
    @schedule = Schedule.new(Time.now)
    @schedule.add_recurrence_date(Date.strptime(params[:event][:starts_at]))
    @event = Event.new(params[:event])
    @event.schedule = @schedule
 
    respond_to do |format|
      if @event.save
        format.html  { redirect_to(@event,
                      :notice => 'Event was successfully created.') }
        format.json  { render :json => @event,
                      :status => :created, :location => @event }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @event.errors,
                    :status => :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
    @next = @event.schedule.first.strftime("%A, %b %e")
    @repeats = (not @event.schedule.rrules.empty?)

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @event }
    end
  end

  def edit
    @event = Event.find(params[:id])
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
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
