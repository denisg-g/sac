class AddAvatarFileNameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :avatar_file_name, :string
  end
end
