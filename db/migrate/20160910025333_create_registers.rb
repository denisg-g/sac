class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.references :student, index: true, foreign_key: true
      t.string :year
      t.string :colegio_precedencia
      t.boolean :pago
      t.string :repitente
      t.string :extracurricular

      t.timestamps null: false
    end
  end
end
