class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.decimal :parcial1
      t.decimal :parcial2
      t.decimal :semestre1
      t.decimal :parcial3
      t.decimal :parcial4
      t.decimal :semestre2
      t.decimal :nota_final
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
