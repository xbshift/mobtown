class Category < ActiveRecord::Base
  attr_accessible :name, :prose
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :dance_classes

end
