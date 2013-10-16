class RentalInquiry < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :description, :when, :guest_count, :budget, :details

  validates_presence_of :name, :email, :phone
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
end
