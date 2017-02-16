class AddFechaNacToStudents < ActiveRecord::Migration
  def change
    add_column :students, :fecha_nac, :date
  end
end
