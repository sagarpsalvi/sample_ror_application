class Clauses < ActiveRecord::Migration[5.1]
  def self.up
      
      create_table :clauses do |t|
         t.column :tag, :string
         t.column :clause_text, :string
         t.column :title, :string
      end
   end

   def self.down
      drop_table :subjects
   end
end
