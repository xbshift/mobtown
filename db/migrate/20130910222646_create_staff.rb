class CreateStaff < ActiveRecord::Migration
  def change
    create_table :staff do |t|
      t.string :name
      t.text :bio
      t.string :email
      t.integer :order

      t.timestamps
    end
  end
end
