class AddSlugToDanceClass < ActiveRecord::Migration
  def change
    add_column :dance_classes, :slug, :string
    add_index :dance_classes, :slug
  end
end
