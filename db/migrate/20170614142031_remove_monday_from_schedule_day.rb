class RemoveMondayFromScheduleDay < ActiveRecord::Migration
  def change
    remove_column :schedule_days, :monday, :boolean
  end
end
