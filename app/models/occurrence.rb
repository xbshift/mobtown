class Occurrence < ActiveRecord::Base
  attr_accessible :end, :start, :event_id
  belongs_to :event
  
  start_of_today = Time.now.midnight
  end_of_today = Time.now.midnight + 1.day + 2.hours
  tomorrow = Time.now.midnight + 1.day + 2.hours
  this_coming_sunday = Date.today + 7.days - Date.today.wday
  far_enough = Date.today + 45.days

  default_scope where('start >= ?', start_of_today).order('start') 

  scope :this_week, where('start < ?', Date.today + 9.days)
  scope :next_3, limit(3)

  scope :two_weeks, where('start < ?', Date.today + 14.days)
  scope :tonight, where('start < ?', tomorrow)
  scope :later_this_week, where('start between ? and ?', tomorrow, this_coming_sunday)
  scope :this_month, where('start between ? and ?', this_coming_sunday + 1.minute, far_enough) 

end
