class DropScheduleBlock < ActiveRecord::Migration
  def change
  	drop_table :schedule_blocks
  end
end
