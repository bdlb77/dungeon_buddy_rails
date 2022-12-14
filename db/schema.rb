# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_30_150041) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_characters", force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.bigint "user_id", null: false
    t.string "character_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_characters_on_campaign_id"
    t.index ["user_id"], name: "index_campaign_characters_on_user_id"
  end

  create_table "campaign_requests", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "user_id", null: false
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_requests_on_campaign_id"
    t.index ["user_id"], name: "index_campaign_requests_on_user_id"
  end

  create_table "campaign_sessions", force: :cascade do |t|
    t.string "location"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.float "latitude"
    t.float "longitude"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_sessions_on_campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "active"
    t.integer "maximum_player_count"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaign_characters", "campaigns"
  add_foreign_key "campaign_characters", "users"
  add_foreign_key "campaign_requests", "campaigns"
  add_foreign_key "campaign_requests", "users"
  add_foreign_key "campaign_sessions", "campaigns"
  add_foreign_key "campaigns", "users"
end
