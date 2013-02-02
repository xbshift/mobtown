class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starts_at
      t.datetime :ends_at
      t.datetime :expiration
      t.boolean :special
      t.text :summary
      t.text :prose

      t.timestamps
    end
  end
end
