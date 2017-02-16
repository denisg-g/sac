class CreateTelTeachers < ActiveRecord::Migration
  def change
    create_table :tel_teachers do |t|
      t.string :tipo
      t.string :numero
      t.references :teacher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
