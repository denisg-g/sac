class RemoveXFromScheduleBlock < ActiveRecord::Migration
  def change
    remove_column :schedule_blocks, :x, :boolean
  end
end
