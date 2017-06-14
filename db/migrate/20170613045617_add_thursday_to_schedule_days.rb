class AddThursdayToScheduleDays < ActiveRecord::Migration
  def change
    add_column :schedule_days, :thursday, :boolean
  end
end
