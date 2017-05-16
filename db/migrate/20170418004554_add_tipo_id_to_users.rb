class AddTipoIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tipo_id, :integer
  end
end
