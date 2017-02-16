class AddTelToStudents < ActiveRecord::Migration
  def change
    add_column :students, :tel, :string
  end
end
