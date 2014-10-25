class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :system, index: true, null: false
      t.string :username, limit: 50, null: false
      t.string :password_digest, limit: 60, null: false
      t.string :email, limit: 50, null: false

      t.timestamps
    end
    add_index :users, [ :system_id, :username ], unique: true
    add_index :users, [ :system_id, :email ], unique: true
  end
end
