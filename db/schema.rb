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

ActiveRecord::Schema.define(version: 20170704075731) do

  create_table "boguses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checklist_items", force: :cascade do |t|
    t.integer  "checklist_id"
    t.string   "text"
    t.string   "value_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "metric_target_max"
    t.string   "metric_target_min"
    t.boolean  "mandatory"
    t.index ["checklist_id"], name: "index_checklist_items_on_checklist_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "owner_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "frequency"
    t.datetime "last_implemented_date"
    t.index ["owner_id"], name: "index_checklists_on_owner_id"
  end

  create_table "dice", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_options", force: :cascade do |t|
    t.string   "text_value"
    t.string   "context"
    t.integer  "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "implementation_items", force: :cascade do |t|
    t.integer  "implementation_id"
    t.string   "text"
    t.boolean  "binary_value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "metric_value"
    t.string   "metric_target_max"
    t.string   "metric_target_min"
    t.index ["implementation_id"], name: "index_implementation_items_on_implementation_id"
  end

  create_table "implementations", force: :cascade do |t|
    t.integer  "checklist_id"
    t.datetime "implemented_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "implementor_id"
    t.index ["checklist_id"], name: "index_implementations_on_checklist_id"
    t.index ["implementor_id"], name: "index_implementations_on_implementor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.string   "api_key"
    t.integer  "status",          default: 0
    t.string   "email"
    t.string   "activation_code"
    t.boolean  "admin"
  end

end
