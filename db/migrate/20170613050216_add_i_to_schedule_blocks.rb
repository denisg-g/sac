class AddIToScheduleBlocks < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :i, :boolean
  end
end
