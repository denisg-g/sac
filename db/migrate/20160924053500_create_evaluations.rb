class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :name
      t.decimal :value
      t.string :from
      t.references :note, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
