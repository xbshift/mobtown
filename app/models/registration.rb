class Registration < ActiveRecord::Base
  attr_accessible :name, :email, :amount_paid, :how_paid
  belongs_to :pass

  validates :name, :presence => "We need a name to identify you at the door."
  validates :email, :presence => "We need an email address to contact you in case of cancelation. We will not email or unless you explicitly opt in to receive mailings."

end
