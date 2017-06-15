class RemoveIiFromScheduleBlock < ActiveRecord::Migration
  def change
    remove_column :schedule_blocks, :ii, :boolean
  end
end
