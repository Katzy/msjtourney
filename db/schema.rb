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

ActiveRecord::Schema.define(version: 20151011215659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: true do |t|
    t.string  "school"
    t.string  "coach"
    t.string  "address"
    t.string  "city"
    t.string  "state"
    t.string  "zip_code"
    t.string  "school_phone"
    t.string  "email"
    t.string  "best_phone"
    t.boolean "full_team_entry",     default: false
    t.boolean "individual_entry",    default: false
    t.string  "number_of_wrestlers"
    t.string  "fee",                 default: "",    null: false
    t.string  "section"
  end

  create_table "teams", force: true do |t|
    t.string  "school"
    t.string  "_106"
    t.string  "_113"
    t.string  "_120"
    t.string  "_126"
    t.string  "_132"
    t.string  "_138"
    t.string  "_145"
    t.string  "_152"
    t.string  "_160"
    t.string  "_170"
    t.string  "_182"
    t.string  "_195"
    t.string  "_220"
    t.string  "_285"
    t.integer "user_id"
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "tournaments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "size"
    t.integer  "user_id"
  end

  add_index "tournaments", ["user_id"], name: "index_tournaments_on_user_id", using: :btree

  create_table "tournaments_users", id: false, force: true do |t|
    t.integer "tournament_id"
    t.integer "user_id"
  end

  add_index "tournaments_users", ["tournament_id"], name: "index_tournaments_users_on_tournament_id", using: :btree
  add_index "tournaments_users", ["user_id"], name: "index_tournaments_users_on_user_id", using: :btree

  create_table "tournaments_wrestlers", id: false, force: true do |t|
    t.integer "tournament_id"
    t.integer "wrestler_id"
  end

  add_index "tournaments_wrestlers", ["tournament_id"], name: "index_tournaments_wrestlers_on_tournament_id", using: :btree
  add_index "tournaments_wrestlers", ["wrestler_id"], name: "index_tournaments_wrestlers_on_wrestler_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.string   "school",                 default: "",    null: false
    t.string   "abbreviation",           default: "",    null: false
    t.string   "cell",                   default: "",    null: false
    t.string   "section",                default: "",    null: false
    t.integer  "tournament_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["tournament_id"], name: "index_users_on_tournament_id", using: :btree

  create_table "wrestlers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "weight"
    t.integer  "grade"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "section_place"
    t.integer  "state_place"
    t.integer  "tourney1_place"
    t.integer  "tourney2_place"
    t.integer  "tourney3_place"
    t.integer  "tourney4_place"
    t.integer  "tourney5_place"
    t.integer  "tourney6_place"
    t.integer  "tourney7_place"
    t.integer  "tourney8_place"
    t.text     "comments"
    t.string   "school"
    t.integer  "user_id"
    t.string   "abbreviation",   default: "", null: false
  end

  add_index "wrestlers", ["user_id"], name: "index_wrestlers_on_user_id", using: :btree

end
