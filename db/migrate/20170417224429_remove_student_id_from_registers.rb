class RemoveStudentIdFromRegisters < ActiveRecord::Migration
  def change
    remove_column :registers, :student_id, :integer
  end
end
