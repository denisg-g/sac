class AddTipoSangreToStudents < ActiveRecord::Migration
  def change
    add_column :students, :tipo_sangre, :string
  end
end
