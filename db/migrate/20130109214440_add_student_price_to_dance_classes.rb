class AddStudentPriceToDanceClasses < ActiveRecord::Migration
  def change
    add_column, :student_price, :decimal, :precision => 8, :scale => 2
    add_column, :session_dates, :string
  end
end
