class AddIiToScheduleBlocks < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :ii, :boolean
  end
end
