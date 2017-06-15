class RemoveFridayFromScheduleDay < ActiveRecord::Migration
  def change
    remove_column :schedule_days, :friday, :boolean
  end
end
