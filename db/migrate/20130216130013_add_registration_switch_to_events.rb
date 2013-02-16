class AddRegistrationSwitchToEvents < ActiveRecord::Migration
  def up 
    add_column :events, :registration_switch, :boolean
  end
  def down
    remove_column :events, :registration_switch
  end
end
