class AddIsLockedToClauses < ActiveRecord::Migration[5.1]
  def change
    add_column :clauses, :is_locked, :boolean, default: false
  end
end
