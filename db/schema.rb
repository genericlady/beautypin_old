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

ActiveRecord::Schema.define(version: 20160503160628) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.time     "start_time"
  end

  add_index "appointments", ["employee_id"], name: "index_appointments_on_employee_id"
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id"

  create_table "beauty_place_locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beauty_places", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "published",  default: false
  end

  create_table "deals", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "discount",        limit: 100
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "beauty_place_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employments", force: :cascade do |t|
    t.integer  "beauty_place_id"
    t.integer  "employee_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "employments", ["beauty_place_id"], name: "index_employments_on_beauty_place_id"
  add_index "employments", ["employee_id"], name: "index_employments_on_employee_id"

  create_table "locatables", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "deal_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "beauty_place_id"
  end

  add_index "locatables", ["deal_id"], name: "index_locatables_on_deal_id"
  add_index "locatables", ["location_id"], name: "index_locatables_on_location_id"

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ip_address"
    t.string   "city"
    t.string   "state"
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beauty_place_id"
  end

  add_index "ownerships", ["beauty_place_id"], name: "index_ownerships_on_beauty_place_id"
  add_index "ownerships", ["user_id"], name: "index_ownerships_on_user_id"

  create_table "searches", force: :cascade do |t|
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price",      precision: 5, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "deal_id"
  end

  create_table "user_locations", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_locations", ["location_id"], name: "index_user_locations_on_location_id"
  add_index "user_locations", ["user_id"], name: "index_user_locations_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
