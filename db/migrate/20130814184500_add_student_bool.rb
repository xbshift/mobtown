class AddStudentBool < ActiveRecord::Migration
  def change
    add_column :registrations, :student, :boolean, default: false
  end
end
