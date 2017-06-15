class AddBloqueToScheduleDay < ActiveRecord::Migration
  def change
    add_column :schedule_days, :bloque, :integer
  end
end
