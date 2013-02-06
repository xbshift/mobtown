class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :rank
      t.string :slug
      t.text :prose

      t.timestamps
    end
    add_index :categories, :slug
  end
end
