class CreateClauses < ActiveRecord::Migration[5.1]
  def change
      create_table :clauses do |t|

      t.timestamps
    end
  end
end
