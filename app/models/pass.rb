class Pass < ActiveRecord::Base
  attr_accessible :name, :price, :description, :limit, :registrations
  belongs_to :passable, :polymorphic => true
  has_many :registrations

  def soldout?
    if self.limit.nil?
      return false
    end
    if self.limit > self.registrations.count
      return false
    else
      return true
    end
  end

  def remaining
    if self.limit.nil?
      return nil
    else
      return self.limit - self.registrations.count
    end
  end

  def paid_online
    self.registrations.where(:how_paid => 'Stripe').collect{|r| r.amount_paid}.sum
  end

  def paid_by_card
    self.registrations.where(:how_paid => 'Card').collect{|r| r.amount_paid}.sum
  end

  def paid_in_cash 
    self.registrations.where(:how_paid => 'Cash').collect{|r| r.amount_paid}.sum
  end

  def paid_total
    self.registrations.collect{|r| r.amount_paid}.sum
  end
end
