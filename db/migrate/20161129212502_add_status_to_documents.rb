class AddStatusToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :status, :boolean
  end
end
