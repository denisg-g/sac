class RemoveTuesdayFromScheduleDay < ActiveRecord::Migration
  def change
    remove_column :schedule_days, :tuesday, :boolean
  end
end
