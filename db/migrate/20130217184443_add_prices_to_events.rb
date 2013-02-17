class AddPricesToEvents < ActiveRecord::Migration
  def up
    add_column :events, :price, :decimal, :precision => 8, :scale => 2 
    add_column :events, :student_price, :decimal, :precision => 8, :scale => 2 
  end
  def down
    remove_column :events, :price
    remove_column :events, :student_price
  end

end
