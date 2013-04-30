class Occurrence < ActiveRecord::Base
  attr_accessible :end, :start, :event_id
  belongs_to :event
  
  scope :tonight, where('start between ? and ?', Date.today.beginning_of_day, Date.today.end_of_day).order(:start)

  scope :this_week, where('start between ? and ?', Date.today, Date.today.end_of_week).order(:start)

  scope :next_week, where('start between ? and ?', Date.today.end_of_week, Date.today.end_of_week + 7.days).order(:start)

  scope :next, lambda { |n| where('start > ?', Date.today).order(:start).limit(n) }

  scope :within, lambda { |time_delta| where('start between ? and ?', Date.today, Date.today + time_delta).order(:start) }

  scope :between, lambda { |a, b| where('start between ? and ?', a, b).order(:start) }
end
