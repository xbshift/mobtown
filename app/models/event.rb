class Event < ActiveRecord::Base
  attr_accessible :ends_at, :expiration, :prose, :special, :starts_at, :summary, :title, :photo, :schedule, :link, :price, :student_price, :registration_switch, :event_id

  has_many :occurrences

  def next
    :occurrences.sort { |a,b| a.start <=> b.start } [0]
  end

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  has_attached_file :photo, :styles => { :carousel => "700x450#",
                                         :small => "300x" },
                    :url => "/system/event_photo/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/event_photo/:id/:style/:basename.:extension"
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
end
