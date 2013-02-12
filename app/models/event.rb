class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  include IceCube 
  serialize :schedule, Hash


  def schedule=(new_schedule)
    write_attribute(:schedule, new_schedule.to_hash)
  end

  def schedule
    Schedule.from_hash(read_attribute(:schedule), :start_date_override => Date.today.midnight)
  end

  attr_accessible :ends_at, :expiration, :prose, :special, :starts_at, :summary, :title, :photo, :schedule, :link

  has_attached_file :photo, :styles => { :carousel => "700x450#",
                                         :small => "300x" },
                    :url => "/system/event_photo/:id/:basename.:extension",
                    :path => ":rails_root/system/public/event_photo/:id/:style/:basename.:extension"
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
end
