class CreateScheduleDays < ActiveRecord::Migration
  def change
    create_table :schedule_days do |t|
      t.string :name
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
