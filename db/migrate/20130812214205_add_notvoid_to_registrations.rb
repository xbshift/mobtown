class AddNotvoidToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :void, :boolean, default: false
  end
end
