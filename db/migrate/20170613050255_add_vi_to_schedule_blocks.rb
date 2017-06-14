class AddViToScheduleBlocks < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :vi, :boolean
  end
end
