class AddCategoryToDanceClass < ActiveRecord::Migration
  def change
    add_column :dance_classes, :category, :string
  end
end
