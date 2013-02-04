require 'ice_cube'

class Event < ActiveRecord::Base
  include IceCube 
  serialize :schedule, Hash

  def schedule=(new_schedule)
    write_attribute(:schedule, new_schedule.to_hash)
  end

  def schedule
    Schedule.from_hash(read_attribute(:schedule), :start_date_override => Date.today.midnight)
  end

  attr_accessible :ends_at, :expiration, :prose, :special, :starts_at, :summary, :title, :photo, :schedule

  has_attached_file :photo, :styles => { :carousel => "700x450#",
                                         :small => "300x" },
                    :url => "/assets/events/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
end
