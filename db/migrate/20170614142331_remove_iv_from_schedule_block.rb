class RemoveIvFromScheduleBlock < ActiveRecord::Migration
  def change
    remove_column :schedule_blocks, :iv, :boolean
  end
end
