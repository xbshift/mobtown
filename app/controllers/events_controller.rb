class EventsController < ApplicationController
  include EventHelper
  include IceCube

  def index
    @events = Event.all
    @events = expand_events(@events, 60.days)
  end

  def new
    @event = Event.new
  end

  def create
    @schedule = Schedule.new(Time.now)
    @schedule.add_recurrence_date(Date.strptime(params[:event][:starts_at]))
    @event = Event.new(params[:event])
    @event.schedule = @schedule
 
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :action => "new"
    end
  end

  def show
    @event = Event.find(params[:id])
    if request.path != event_path(@event)
      redirect_to @event, status: :moved_permanently
    end
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
