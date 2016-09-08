class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.string :tipo_id
      t.string :cedula
      t.string :first
      t.string :second
      t.string :apellido
      t.string :apellido1
      t.string :tipotutor
      t.string :email
      t.string :direction

      t.timestamps null: false
    end
  end
end
