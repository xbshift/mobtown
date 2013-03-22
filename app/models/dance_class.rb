class DanceClass < ActiveRecord::Base
  attr_accessible :name, :description, :category, :price, :student_price, :session_dates, :category_id, :new_category_name
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category

  attr_accessor :new_category_name
  before_save :create_category_from_name

  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end

end
