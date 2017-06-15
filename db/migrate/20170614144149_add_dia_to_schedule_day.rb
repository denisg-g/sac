class AddDiaToScheduleDay < ActiveRecord::Migration
  def change
    add_column :schedule_days, :dia, :string
  end
end
