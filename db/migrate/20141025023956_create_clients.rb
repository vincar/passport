class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false, limit: 50
      t.references :system, index: true, null: false
      t.boolean :activate, default: false

      t.timestamps
    end
    add_index :clients, [ :name, :system_id ], unique: true
  end
end

