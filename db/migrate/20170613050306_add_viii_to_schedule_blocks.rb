class AddViiiToScheduleBlocks < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :viii, :boolean
  end
end
