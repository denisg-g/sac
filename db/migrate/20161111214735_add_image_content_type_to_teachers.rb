class AddImageContentTypeToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :image_content_type, :string
  end
end
