class Occurrence < ActiveRecord::Base
  attr_accessible :end, :start, :event_id
  belongs_to :event
end
