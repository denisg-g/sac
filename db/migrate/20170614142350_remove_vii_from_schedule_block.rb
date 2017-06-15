class RemoveViiFromScheduleBlock < ActiveRecord::Migration
  def change
    remove_column :schedule_blocks, :vii, :boolean
  end
end
