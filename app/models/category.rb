# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  rank       :integer
#  slug       :string(255)
#  prose      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'friendly_id'

class Category < ActiveRecord::Base
  attr_accessible :name, :prose
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :dance_classes

end
