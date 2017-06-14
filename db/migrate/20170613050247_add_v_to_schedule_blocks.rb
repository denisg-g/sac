class AddVToScheduleBlocks < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :v, :boolean
  end
end
