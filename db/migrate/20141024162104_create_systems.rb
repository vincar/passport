class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :schema, limit: 50, null: false
      t.string :name, limit: 50, null: false
      t.string :uid, limit: 64, null: false
      t.string :secret, limit: 64, null: false
      t.boolean :locked, default: false
      t.date :timeout
      t.boolean :autorise, null: false, default: false

      t.timestamps
    end
    add_index :systems, [ :schema, :uid ], unique: true
  end
end
