class Pass < ActiveRecord::Base
  attr_accessible :name, :price, :description, :limit, :registrations
  belongs_to :event
  has_many :registrations
end
