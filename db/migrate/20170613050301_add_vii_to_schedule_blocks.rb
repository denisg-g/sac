class AddViiToScheduleBlocks < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :vii, :boolean
  end
end
