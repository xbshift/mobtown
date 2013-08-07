class AddDescriptionToPass < ActiveRecord::Migration
  def change
    add_column :passes, :description, :string
  end
end
