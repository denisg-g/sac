class AddTuesdayToScheduleDays < ActiveRecord::Migration
  def change
    add_column :schedule_days, :tuesday, :boolean
  end
end
