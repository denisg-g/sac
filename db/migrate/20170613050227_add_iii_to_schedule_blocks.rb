class AddIiiToScheduleBlocks < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :iii, :boolean
  end
end
