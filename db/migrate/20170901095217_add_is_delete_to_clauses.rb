class AddIsDeleteToClauses < ActiveRecord::Migration[5.1]
  def change
    add_column :clauses, :is_delete, :boolean, default: 0
  end
end
