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

ActiveRecord::Schema.define(version: 2018_07_10_113615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "belts", force: :cascade do |t|
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade"], name: "index_belts_on_grade", unique: true
  end

  create_table "machine_belts", force: :cascade do |t|
    t.bigint "machine_id"
    t.bigint "belt_id"
    t.integer "length"
    t.integer "width"
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["belt_id"], name: "index_machine_belts_on_belt_id"
    t.index ["machine_id"], name: "index_machine_belts_on_machine_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "section"
    t.string "sub_section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mill_machine_belts", force: :cascade do |t|
    t.bigint "mill_machine_id"
    t.bigint "belt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["belt_id"], name: "index_mill_machine_belts_on_belt_id"
    t.index ["mill_machine_id", "belt_id"], name: "index_mill_machine_belts_on_mill_machine_id_and_belt_id", unique: true
    t.index ["mill_machine_id"], name: "index_mill_machine_belts_on_mill_machine_id"
  end

  create_table "mill_machines", force: :cascade do |t|
    t.bigint "mill_id"
    t.bigint "machine_id"
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_mill_machines_on_machine_id"
    t.index ["mill_id", "machine_id"], name: "index_mill_machines_on_mill_id_and_machine_id", unique: true
    t.index ["mill_id"], name: "index_mill_machines_on_mill_id"
  end

  create_table "mills", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.index ["code"], name: "index_mills_on_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "machine_belts", "belts"
  add_foreign_key "machine_belts", "machines"
  add_foreign_key "mill_machine_belts", "belts"
  add_foreign_key "mill_machine_belts", "mill_machines"
  add_foreign_key "mill_machines", "machines"
  add_foreign_key "mill_machines", "mills"
end
