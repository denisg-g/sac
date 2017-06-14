class AddXToScheduleBlocks < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :x, :boolean
  end
end
