require 'FriendlyId'

class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  attr_accessible :prose, :publish, :slug, :title

end
