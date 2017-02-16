class AddImageFileNameToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :image_file_name, :string
  end
end
