class Registration < ActiveRecord::Base
  attr_accessible :name, :email, :amount_paid, :how_paid, :void
  belongs_to :pass

  validates_presence_of :name, :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  scope :not_void, where(:void => false)
end
