class CreateHardwares < ActiveRecord::Migration
  def change
    create_table :hardwares do |t|
      t.references :client, null: false
      t.string :hardware_code, limit: 100, null: false
      t.boolean :activate, default: false

      t.timestamps
    end
    add_index :hardwares, [ :client_id, :hardware_code ], unique: true
  end
end
