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

ActiveRecord::Schema.define(version: 20160111023049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  add_index "carts", ["order_id"], name: "index_carts_on_order_id", using: :btree

  create_table "educations", force: :cascade do |t|
    t.integer  "request_id"
    t.string   "school_name"
    t.string   "degree"
    t.string   "location"
    t.string   "awards"
    t.date     "graduation_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "educations", ["request_id"], name: "index_educations_on_request_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.integer  "request_id"
    t.string   "company"
    t.string   "location"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "job_title"
    t.text     "responsibilities"
    t.text     "awards"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "experiences", ["request_id"], name: "index_experiences_on_request_id", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.boolean  "completed",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "phone_number"
    t.text     "objective"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "order_id"
    t.string   "file"
    t.text     "comment"
  end

  add_index "requests", ["order_id"], name: "index_requests_on_order_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.integer  "request_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "skills", ["request_id"], name: "index_skills_on_request_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "order_id"
  end

  add_index "users", ["order_id"], name: "index_users_on_order_id", using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.integer  "request_id"
    t.string   "organization"
    t.string   "location"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "duties"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "volunteers", ["request_id"], name: "index_volunteers_on_request_id", using: :btree

  add_foreign_key "carts", "orders"
  add_foreign_key "educations", "requests"
  add_foreign_key "experiences", "requests"
  add_foreign_key "requests", "orders"
  add_foreign_key "skills", "requests"
  add_foreign_key "users", "orders"
  add_foreign_key "volunteers", "requests"
end
