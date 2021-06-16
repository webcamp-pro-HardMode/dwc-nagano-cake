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

ActiveRecord::Schema.define(version: 20210616080929) do

  create_table "addresses", force: :cascade do |t|
    t.string   "postal_code"
    t.string   "address"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "item_id"
    t.integer  "customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "first_name"
    t.string   "family_name"
    t.string   "kana_sei"
    t.string   "kana_mei"
    t.string   "postal_code"
    t.string   "address"
    t.string   "phone_number"
    t.boolean  "is_exist",               default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "items", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name"
    t.integer  "price"
    t.text     "introduction"
    t.boolean  "is_status",    default: true, null: false
    t.string   "image_id"
    t.integer  "genres_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "quantity"
    t.integer  "order_status", default: 0, null: false
    t.integer  "price"
    t.integer  "total_price"
    t.integer  "item_id"
    t.integer  "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "shipping_cost"
    t.string   "postal_code"
    t.string   "address"
    t.string   "name"
    t.integer  "payment_method", default: 0, null: false
    t.integer  "status",         default: 0, null: false
    t.integer  "total_cost"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "customer_id"
  end

end
