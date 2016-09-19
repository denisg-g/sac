class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :seccion
      t.string :max
      t.string :turno
      t.string :tipo

      t.timestamps null: false
    end
  end
end
