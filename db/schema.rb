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

ActiveRecord::Schema.define(version: 20200630164759) do

  create_table "layers", force: :cascade do |t|
    t.integer  "layercount", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "layerthicknesses", force: :cascade do |t|
    t.float    "thickness",  limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "layer_id",   limit: 4
  end

  create_table "orders", force: :cascade do |t|
    t.float    "pcb_price",       limit: 24
    t.float    "shipment_charge", limit: 24
    t.float    "tax",             limit: 24
    t.float    "total_price",     limit: 24
    t.string   "status",          limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "pcb_pricing_id",  limit: 4
    t.integer  "useraddress_id",  limit: 4
    t.integer  "user_id",         limit: 4
  end

  create_table "pcb_pricings", force: :cascade do |t|
    t.float    "quantity_from",        limit: 24
    t.float    "quantity_to",          limit: 24
    t.float    "price_per_unit_sq_cm", limit: 24
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "layerthickness_id",    limit: 4
  end

  create_table "useraddresses", force: :cascade do |t|
    t.text     "address",    limit: 65535
    t.string   "city",       limit: 255
    t.string   "pincode",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",             limit: 255
    t.string   "crypted_password",  limit: 255
    t.string   "password_salt",     limit: 255
    t.string   "persistence_token", limit: 255
    t.boolean  "is_admin"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest",   limit: 255
    t.text     "user_name",         limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
