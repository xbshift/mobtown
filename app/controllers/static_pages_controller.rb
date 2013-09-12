class StaticPagesController < ApplicationController
  include EventHelper
  def home 
    @featured = Occurrence.next(3)
    @carousel = Occurrence.within(2.weeks)
  end

  def yelp_example
    @featured = Occurrence.next(3)
    @carousel = Occurrence.within(2.weeks)
  end

  def venue
  end

  def map
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
