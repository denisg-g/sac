class RemoveIxFromScheduleBlock < ActiveRecord::Migration
  def change
    remove_column :schedule_blocks, :ix, :boolean
  end
end
