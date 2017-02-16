class AddNumberToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :number, :numeric
  end
end
