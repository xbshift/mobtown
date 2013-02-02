class Event < ActiveRecord::Base
  attr_accessible :ends_at, :expiration, :prose, :special, :starts_at, :summary, :title
end
