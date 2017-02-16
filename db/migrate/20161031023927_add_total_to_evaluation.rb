class AddTotalToEvaluation < ActiveRecord::Migration
  def change
    add_column :evaluations, :total, :numeric
  end
end
