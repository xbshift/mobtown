class StaticPagesController < ApplicationController
  def home 
    @events = Event.find(:all, :order => 'starts_at asc')
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
