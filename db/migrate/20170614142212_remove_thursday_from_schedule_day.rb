class RemoveThursdayFromScheduleDay < ActiveRecord::Migration
  def change
    remove_column :schedule_days, :thursday, :boolean
  end
end
