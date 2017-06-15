class RemoveIiiFromScheduleBlock < ActiveRecord::Migration
  def change
    remove_column :schedule_blocks, :iii, :boolean
  end
end
