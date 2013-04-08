class StaticPagesController < ApplicationController
  include EventHelper
  def home 
    @featured = Occurrence.next_3
    @carousel = Occurrence.two_weeks
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
