class AddImageFileSizeToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :image_file_size, :string
  end
end
