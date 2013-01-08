class CreateDanceClasses < ActiveRecord::Migration
  def change
    create_table :dance_classes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
