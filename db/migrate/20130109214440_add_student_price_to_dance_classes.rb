class AddStudentPriceToDanceClasses < ActiveRecord::Migration
  def change
    add_column :dance_classes, :student_price, :decimal, :precision => 8, :scale => 2
    add_column :dance_classes, :session_dates, :string
  end
end
