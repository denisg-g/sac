class CreateStudentsTutors < ActiveRecord::Migration
  def change
    create_table :students_tutors, :id=> false do |t|
    	t.references :student
    	t.references :tutor
    end
    add_index :students_tutors, :student_id
    add_index :students_tutors, :tutor_id
  end
end
