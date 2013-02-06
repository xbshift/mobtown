class DanceClass < ActiveRecord::Base
  attr_accessible :name, :description, :category, :price, :student_price, :session_dates, :category_id
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  belongs_to :category

end
