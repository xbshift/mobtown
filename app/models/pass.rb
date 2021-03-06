# == Schema Information
#
# Table name: passes
#
#  id            :integer          not null, primary key
#  event_id      :integer
#  name          :string(255)
#  price         :decimal(8, 2)
#  available     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :string(255)
#  limit         :integer
#  passable_id   :integer
#  passable_type :string(255)
#  session       :string(255)
#  archived      :boolean          default(FALSE)
#  student_price :decimal(8, 2)
#

class Pass < ActiveRecord::Base
  attr_accessible :name, :price, :student_price, :description, :limit, :session, :archived, :registrations
  belongs_to :passable, :polymorphic => true
  has_many :registrations

  def soldout?
    if self.limit.nil?
      return false
    end
    if self.limit > self.registrations.not_void.count
      return false
    else
      return true
    end
  end

  def remaining
    if self.limit.nil?
      return nil
    else
      return self.limit - self.registrations.not_void.count
    end
  end

  def few_left?
    threshold = 10
    if self.remaining.nil?
      return false
    elsif (self.remaining < threshold) and (self.remaining > 0)
      return true
    end
  end

  def paid_online
    self.registrations.not_void.where(:how_paid => 'Stripe').collect{|r| r.amount_paid}.sum
  end

  def paid_by_card
    self.registrations.not_void.where(:how_paid => 'Card').collect{|r| r.amount_paid}.sum
  end

  def paid_in_cash 
    self.registrations.not_void.where(:how_paid => 'Cash').collect{|r| r.amount_paid}.sum
  end

  def paid_on_tab
    self.registrations.not_void.where(:how_paid => 'Tab').collect{|r| r.amount_paid}.sum
  end

  def paid_total
    self.registrations.not_void.collect{|r| r.amount_paid}.sum
  end

  scope :active, where(:archived => false)

  def status
    if self.archived == true
      return 'Archived'
    elsif self.soldout?
      return 'Sold Out'
    else
      return 'For Sale'
    end
  end

  def id_string
    self.passable.id.to_s + '-' + self.id.to_s
  end

  def summary
    s = self.passable.name
    if not self.session.nil?
      s += ' ' + self.session
    end
    s += ' ' + self.name
    return s
  end
end
