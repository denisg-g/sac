class AddLugarNacToStudents < ActiveRecord::Migration
  def change
    add_column :students, :lugar_nac, :string
  end
end
