class AddSessionToPasses < ActiveRecord::Migration
  def change
    add_column :passes, :session, :string
    add_column :passes, :archived, :boolean, default: false
  end
end
