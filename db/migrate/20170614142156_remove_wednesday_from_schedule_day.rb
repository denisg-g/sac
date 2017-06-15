class RemoveWednesdayFromScheduleDay < ActiveRecord::Migration
  def change
    remove_column :schedule_days, :wednesday, :boolean
  end
end
