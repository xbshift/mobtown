class Pass < ActiveRecord::Base
  attr_accessible :name, :price, :student_price, :event_id
  belongs_to :event
end
