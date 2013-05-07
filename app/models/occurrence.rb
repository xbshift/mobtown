class Occurrence < ActiveRecord::Base
  attr_accessible :end, :start, :event_id
  belongs_to :event
  
  scope :tonight, where('start = ?', Date.today).order(:start)

  scope :this_week, where('start between ? and ?', Date.today + 1.day, [Date.today + 1.day, Date.today.end_of_week].min).order(:start)

  scope :next_week, where('start between ? and ?', Date.today.end_of_week + 1.day, Date.today.end_of_week + 7.days).order(:start)

  scope :next, lambda { |n| where('start >= ?', Date.today).order(:start).limit(n) }

  scope :within, lambda { |time_delta| where('start between ? and ?', Date.today, Date.today + time_delta).order(:start) }

  scope :between, lambda { |a, b| where('start between ? and ?', a, b).order(:start) }
end
