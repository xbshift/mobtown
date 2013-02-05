class StaticPagesController < ApplicationController
  include EventHelper
  def home 
    @events = Event.all
    @events = expand_events(@events, 30.days)
  end

  def venue
  end

  def map
  end

  def staff 
  end

  def mob_mentality
  end

  def calendar
  end

  def dances
  end

  def videos
  end
end
