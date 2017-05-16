class SubjectsTeachers < ActiveRecord::Migration
  def change
    create_table :subjects_teachers, id: false do |t|
      t.integer :subject_id
      t.integer :student_id
    end

    add_index :subjects_teachers, :subject_id
    add_index :subjects_teachers, :student_id
  end
end
