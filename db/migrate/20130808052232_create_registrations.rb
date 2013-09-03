class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :email
      t.decimal :amount_paid, :precision => 8, :scale => 2
      t.string :how_paid
      t.integer :pass_id
      t.timestamps
    end
  end
end
