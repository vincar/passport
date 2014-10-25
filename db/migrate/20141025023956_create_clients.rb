class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false, limit: 50
      t.references :system
      t.boolean :activate, null: false

      t.timestamps
    end
    add_index :clients, [ :name, :system_id ], unique: true
  end
end
