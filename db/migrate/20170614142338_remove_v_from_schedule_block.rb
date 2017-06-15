class RemoveVFromScheduleBlock < ActiveRecord::Migration
  def change
    remove_column :schedule_blocks, :v, :boolean
  end
end
