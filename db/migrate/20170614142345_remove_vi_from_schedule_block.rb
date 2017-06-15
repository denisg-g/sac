class RemoveViFromScheduleBlock < ActiveRecord::Migration
  def change
    remove_column :schedule_blocks, :vi, :boolean
  end
end
