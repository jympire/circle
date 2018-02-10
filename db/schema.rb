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

ActiveRecord::Schema.define(version: 20180210195038) do

  create_table "gyms", force: :cascade do |t|
    t.string   "gym_type"
    t.string   "listing_name"
    t.text     "summary"
    t.string   "address_string"
    t.boolean  "is_weights"
    t.boolean  "is_boxing"
    t.boolean  "is_internet"
    t.boolean  "is_lounge"
    t.boolean  "is_shower"
    t.boolean  "is_towel"
    t.boolean  "is_yoga"
    t.boolean  "is_cycling"
    t.boolean  "is_pilates"
    t.boolean  "is_pool"
    t.boolean  "is_basketball"
    t.boolean  "is_childcare"
    t.integer  "price"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_gyms_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "gym_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["gym_id"], name: "index_photos_on_gym_id"
  end

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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "phone_number"
    t.text     "description"
    t.string   "title"
    t.string   "certification"
    t.string   "certification_number"
    t.string   "insurance"
    t.string   "insurance_number"
    t.string   "school"
    t.string   "degree"
    t.string   "location"
    t.string   "interests"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
