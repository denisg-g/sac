class AddAvatarContentTypeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :avatar_content_type, :string
  end
end
