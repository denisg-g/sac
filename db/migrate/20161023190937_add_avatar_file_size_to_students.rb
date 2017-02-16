class AddAvatarFileSizeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :avatar_file_size, :integer
  end
end
