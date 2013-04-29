class Occurrence < ActiveRecord::Base
  attr_accessible :end, :start, :event_id
  belongs_to :event
  

  scope :this_week, where('start between ? and ?', Date.today, Date.today.end_of_week)

  scope :next_week, where('start between ? and ?', Date.today.end_of_week, Date.today.end_of_week + 7.days)

  scope :next, lambda { |n| where('start > ?', Date.today).limit(n) }

  scope :within, lambda { |time_delta| where('start between ? and ?', Date.today, Date.today + time_delta) }
end
