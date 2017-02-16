class AddAvatarUpdatedAtToStudents < ActiveRecord::Migration
  def change
    add_column :students, :avatar_updated_at, :datetime
  end
end
