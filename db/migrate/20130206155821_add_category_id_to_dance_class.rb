class AddCategoryIdToDanceClass < ActiveRecord::Migration
  def change
    add_column :dance_classes, :category_id, :integer
  end
end
