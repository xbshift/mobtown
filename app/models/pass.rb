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
end
