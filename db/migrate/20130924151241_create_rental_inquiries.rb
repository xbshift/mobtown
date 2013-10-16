class CreateRentalInquiries < ActiveRecord::Migration
  def change
    create_table :rental_inquiries do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :description
      t.string :when
      t.integer :guest_count
      t.integer :budget
      t.text :details

      t.timestamps
    end
  end
end
