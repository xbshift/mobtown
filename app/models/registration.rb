# == Schema Information
#
# Table name: registrations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  amount_paid :decimal(8, 2)
#  how_paid    :string(255)
#  pass_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  void        :boolean          default(FALSE)
#  student     :boolean          default(FALSE)
#

class Registration < ActiveRecord::Base
  attr_accessible :name, :email, :amount_paid, :how_paid, :void, :student
  belongs_to :pass

  validates_presence_of :name, :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  LIST_NAME = 'Email List'
 
  def add_to_madmimi_email_list
    mimi = MadMimi.new(AUTH[:madmimi][:username], AUTH[:madmimi][:api_key])
    mimi.add_to_list(self.email, LIST_NAME)
  end

  def backup
    session = GoogleDrive.login(AUTH[:google][:username], AUTH[:google][:password])
    ws = session.spreadsheet_by_key(ENV['log_spreadsheet_key']).worksheets[0]
    last_row = ws.rows.count
    entry = [self.pass.passable.name, self.pass.name, self.name, self.email, self.amount_paid, self.how_paid, created_at.strftime("%d %b. %Y %H:%M"), self.student]
    puts entry
    for col in 0..entry.length
      ws[last_row + 1, col + 1] = entry[col]
    end
    ws.save
    rescue
      pass
  end

  scope :not_void, where(:void => false)
end
