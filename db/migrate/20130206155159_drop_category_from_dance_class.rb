class DropCategoryFromDanceClass < ActiveRecord::Migration
  def up
    remove_column :dance_classes, :category
  end

  def down
    add_column :dance_classes, :category, :string
  end
end
