# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  publish    :boolean
#  prose      :text
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'friendly_id'

class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  attr_accessible :prose, :publish, :slug, :title

end
