# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  starts_at           :datetime
#  ends_at             :datetime
#  expiration          :datetime
#  special             :boolean
#  summary             :text
#  prose               :text
#  url                 :string(255)
#  photo_file_name     :string(255)
#  photo_content_type  :string(255)
#  photo_file_size     :integer
#  photo_updated_at    :datetime
#  slug                :string(255)
#  link                :string(255)
#  schedule            :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  registration_switch :boolean
#  price               :decimal(8, 2)
#  student_price       :decimal(8, 2)
#

class Event < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :ends_at, :expiration, :prose, :special, :starts_at, :summary, :name, :photo, :schedule, :link, :price, :student_price, :registration_switch, :occurrences_attributes, :passes_attributes

  has_many :occurrences, :dependent => :destroy
  has_many :passes, :as => :passable, :dependent => :destroy

  accepts_nested_attributes_for :occurrences, allow_destroy: true, reject_if: :blank_start
  accepts_nested_attributes_for :passes, allow_destroy: true, reject_if: :blank_pass

  def blank_start(attributes)
    attributes[:start].blank?
  end

  def blank_pass(attributes)
    attributes[:name].blank?
    attributes[:price].blank?
  end

  scope :upcoming, joins(:occurrences).where('occurrences.start > ?', Time.now)

  scope :next, lambda {|n| joins(:occurrences).where('occurrences.start > ?', Time.now).order('occurrences.start')[0..n] }

  scope :special, joins(:occurrences).where('events.special = ?', true)

  friendly_id :name, use: [:slugged, :history]

  has_attached_file :photo, :styles => { :carousel => "700x450#",
                                         :small => "300x" },
                    :url => "/system/event_photo/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/event_photo/:id/:style/:basename.:extension"
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
end
