class CreateScheduleBlocks < ActiveRecord::Migration
  def change
    create_table :schedule_blocks do |t|
      t.string :name
      t.references :schedule_day, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
