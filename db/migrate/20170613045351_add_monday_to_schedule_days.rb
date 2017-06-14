class AddMondayToScheduleDays < ActiveRecord::Migration
  def change
    add_column :schedule_days, :monday, :boolean
  end
end
