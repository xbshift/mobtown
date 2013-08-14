class AddStudentPriceToPass < ActiveRecord::Migration
  def change
    add_column :passes, :student_price, :decimal, :precision => 8, :scale => 2
  end
end
