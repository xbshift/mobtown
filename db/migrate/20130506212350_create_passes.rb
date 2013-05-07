class CreatePasses < ActiveRecord::Migration
  def change
    create_table :passes do |t|
      t.belongs_to :event
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :student_price, :precision => 8, :scale => 2
      t.boolean :available

      t.timestamps
    end
  end
end
