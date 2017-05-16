class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :carnet
      t.string :nombre
      t.string :nombre1
      t.string :apellido
      t.string :apellido1
      t.string :email
      t.string :direction
      t.integer :group_id
      t.integer :estado
      t.integer :note

      t.timestamps null: false
    end
  end
end
