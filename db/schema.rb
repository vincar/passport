# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141025233347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: true do |t|
    t.string   "name",       limit: 50,                 null: false
    t.integer  "system_id",                             null: false
    t.boolean  "activate",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["name", "system_id"], name: "index_clients_on_name_and_system_id", unique: true, using: :btree
  add_index "clients", ["system_id"], name: "index_clients_on_system_id", using: :btree

  create_table "hardwares", force: true do |t|
    t.integer  "client_id",                                 null: false
    t.string   "hardware_code", limit: 100,                 null: false
    t.boolean  "activate",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hardwares", ["client_id", "hardware_code"], name: "index_hardwares_on_client_id_and_hardware_code", unique: true, using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id",                                              null: false
    t.string   "name",                      limit: 50
    t.boolean  "admin",                                default: false
    t.boolean  "locked",                               default: false
    t.string   "login_token",               limit: 64
    t.string   "reset_password_token",      limit: 64
    t.datetime "reset_password_created_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "systems", force: true do |t|
    t.string   "schema",     limit: 50,                 null: false
    t.string   "name",       limit: 50,                 null: false
    t.string   "uid",        limit: 64,                 null: false
    t.string   "secret",     limit: 64,                 null: false
    t.boolean  "locked",                default: false
    t.date     "timeout"
    t.boolean  "autorise",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "systems", ["schema", "uid"], name: "index_systems_on_schema_and_uid", unique: true, using: :btree
  add_index "systems", ["schema"], name: "index_systems_on_schema", using: :btree
  add_index "systems", ["uid"], name: "index_systems_on_uid", using: :btree

  create_table "users", force: true do |t|
    t.integer  "system_id",                  null: false
    t.string   "username",        limit: 50, null: false
    t.string   "password_digest", limit: 60, null: false
    t.string   "email",           limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["system_id", "email"], name: "index_users_on_system_id_and_email", unique: true, using: :btree
  add_index "users", ["system_id", "username"], name: "index_users_on_system_id_and_username", unique: true, using: :btree
  add_index "users", ["system_id"], name: "index_users_on_system_id", using: :btree

end
