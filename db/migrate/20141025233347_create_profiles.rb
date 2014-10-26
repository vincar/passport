class CreateProfiles< ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, null: false
      t.string :name, limit: 50
      t.boolean :admin, default: false
      t.boolean :locked, default: false
      t.string :login_token, limit: 64
      t.string :reset_password_token, limit: 64
      t.datetime :reset_password_created_at
      t.datetime :remember_created_at

      t.timestamps
    end
  end
end
