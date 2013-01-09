class AddPriceToDanceClass < ActiveRecord::Migration
  def change
    add_column :dance_classes, :price, :decimal, :precision => 8, :scale => 2
  end
end
