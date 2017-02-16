class StudentsSubjects < ActiveRecord::Migration
  def change
    create_table :students_subjects, id: false do |t|
      t.integer :student_id
      t.integer :subject_id
    end
 
    add_index :students_subjects, :student_id
    add_index :students_subjects, :subject_id
  end
end
