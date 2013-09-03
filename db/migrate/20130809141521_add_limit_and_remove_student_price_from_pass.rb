class AddLimitAndRemoveStudentPriceFromPass < ActiveRecord::Migration
  def change
    add_column :passes, :limit, :integer
    remove_column :passes, :student_price
  end
end
