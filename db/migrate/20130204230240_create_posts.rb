class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.boolean :publish
      t.text :prose
      t.string :slug

      t.timestamps
    end
  end
end
