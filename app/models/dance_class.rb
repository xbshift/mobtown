# == Schema Information
#
# Table name: dance_classes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category    :string(255)
#

class DanceClass < ActiveRecord::Base
  attr_accessible :name, :description, :category, :price, :student_price
end
