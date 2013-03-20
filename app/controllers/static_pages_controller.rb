class StaticPagesController < ApplicationController
  include EventHelper
  def home 
    @events = Event.all
    @featured_events = Event.all
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

  def acquire
  end
end
