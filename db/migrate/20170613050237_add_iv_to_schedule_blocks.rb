class AddIvToScheduleBlocks < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :iv, :boolean
  end
end
