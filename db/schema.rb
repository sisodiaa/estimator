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

ActiveRecord::Schema.define(version: 2018_06_24_134841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "belts", force: :cascade do |t|
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "section"
    t.string "sub_section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "mill_machines", "machines"
  add_foreign_key "mill_machines", "mills"
end
