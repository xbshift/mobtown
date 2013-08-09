class Registration < ActiveRecord::Base
  attr_accessible :name, :email, :amount_paid, :how_paid
  belongs_to :pass
end
