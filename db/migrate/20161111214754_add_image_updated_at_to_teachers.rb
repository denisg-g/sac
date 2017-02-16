class AddImageUpdatedAtToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :image_updated_at, :string
  end
end
