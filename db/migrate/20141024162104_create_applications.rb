class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name, limit: 50, null: false
      t.string :uid, limit: 64, null: false
      t.string :secret, limit: 64, null: false
      t.boolean :locked, default: false
      t.date :deaddate

      t.timestamps
    end
    add_index :applications, :name, unique: true
  end
end
