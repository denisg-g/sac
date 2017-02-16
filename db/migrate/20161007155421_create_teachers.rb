class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :name1
      t.string :lastname
      t.string :lastname1
      t.string :email
      t.string :direction
      t.date :fecha_nac
      t.string :tipo_id
      t.string :cedula
      t.integer :cel
      t.integer :tel

      t.timestamps null: false
    end
  end
end
