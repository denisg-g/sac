class RemoveIFromScheduleBlock < ActiveRecord::Migration
  def change
    remove_column :schedule_blocks, :i, :boolean
  end
end
