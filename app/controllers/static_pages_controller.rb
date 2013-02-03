class StaticPagesController < ApplicationController
  def home 
    @events = Event.find(
      :all, 
      :conditions => {:starts_at => Date.today..(Date.today + 9.days)},
      :order => 'starts_at asc')
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
