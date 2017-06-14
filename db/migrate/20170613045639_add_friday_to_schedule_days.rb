class AddFridayToScheduleDays < ActiveRecord::Migration
  def change
    add_column :schedule_days, :friday, :boolean
  end
end
