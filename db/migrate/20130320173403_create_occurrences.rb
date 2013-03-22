class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.timestamp :start
      t.timestamp :end
      t.integer :event_id

      t.timestamps
    end
  end
end
