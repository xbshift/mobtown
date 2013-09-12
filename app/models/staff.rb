class Staff < ActiveRecord::Base
  attr_accessible :bio, :name, :email, :order, :photo
  validates_presence_of :name, :bio
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :allow_blank => true
  has_attached_file :photo, :styles => { :small => "200x" },
                    :url => "/system/staff_photo/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/staff_photo/:id/:style/:basename.:extension"
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 10.megabytes
end
