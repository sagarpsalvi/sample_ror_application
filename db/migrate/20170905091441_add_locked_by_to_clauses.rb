class AddLockedByToClauses < ActiveRecord::Migration[5.1]
  def change
    add_column :clauses, :locked_by, :string, default: ""
  end
end
