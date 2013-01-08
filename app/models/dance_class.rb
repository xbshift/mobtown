# == Schema Information
#
# Table name: dance_classes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DanceClass < ActiveRecord::Base
  attr_accessible :description, :name
end
