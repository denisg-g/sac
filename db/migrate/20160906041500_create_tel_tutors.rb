class CreateTelTutors < ActiveRecord::Migration
  def change
    create_table :tel_tutors do |t|
      t.string :tipo
      t.integer :numero
      t.references :tutor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
