class ChangeDateTimetoDateInOccurrences < ActiveRecord::Migration
  def up
    change_column :occurrences, :start, :date
    change_column :occurrences, :end, :date
  end

  def down
    change_column :occurrences, :start, :datetime
    change_column :occurrences, :end, :datetime
  end
end
