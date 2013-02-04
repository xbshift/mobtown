class AddScheduleColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :schedule, :hash
  end
end
