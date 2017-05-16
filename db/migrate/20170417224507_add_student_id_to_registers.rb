class AddStudentIdToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :student_id, :integer
  end
end
