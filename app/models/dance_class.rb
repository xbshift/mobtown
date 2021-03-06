# == Schema Information
#
# Table name: dance_classes
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  price         :decimal(8, 2)
#  student_price :decimal(8, 2)
#  session_dates :string(255)
#  slug          :string(255)
#  category_id   :integer
#

class DanceClass < ActiveRecord::Base
  attr_accessible :name, :description, :category, :price, :student_price, :session_dates, :category_id, :new_category_name, :passes_attributes

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category
  has_many :passes, :as => :passable, :dependent => :destroy
  accepts_nested_attributes_for :passes, allow_destroy: true, reject_if: :blank_pass

  attr_accessor :new_category_name
  before_save :create_category_from_name

  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end

  def blank_pass(attributes)
    attributes[:name].blank?
    attributes[:price].blank?
  end

end
