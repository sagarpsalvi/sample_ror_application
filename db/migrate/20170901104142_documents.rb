class Documents < ActiveRecord::Migration[5.1]
  def self.up
    create_table :documents do |t|
      t.column :title, :string, :limit => 32, :null => false
      t.column :document, :text
      t.column :created_at, :timestamp
      t.column :is_delete, :boolean, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
