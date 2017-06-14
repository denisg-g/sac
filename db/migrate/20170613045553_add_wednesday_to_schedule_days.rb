class AddWednesdayToScheduleDays < ActiveRecord::Migration
  def change
    add_column :schedule_days, :wednesday, :boolean
  end
end
