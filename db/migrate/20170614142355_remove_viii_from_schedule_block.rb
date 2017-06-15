class RemoveViiiFromScheduleBlock < ActiveRecord::Migration
  def change
    remove_column :schedule_blocks, :viii, :boolean
  end
end
