class AddIxToScheduleBlocks < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :ix, :boolean
  end
end
