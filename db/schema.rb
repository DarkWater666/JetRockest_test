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

ActiveRecord::Schema.define(version: 2018_11_07_080320) do

  create_table "clubs", force: :cascade do |t|
    t.string "name", null: false
    t.string "service_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "service_name"], name: "index_clubs_on_name_and_service_name", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.integer "home_team_id", null: false
    t.integer "away_team_id", null: false
    t.integer "home_team_goals"
    t.integer "away_team_goals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.integer "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_players_on_club_id"
  end

  create_table "rates", force: :cascade do |t|
    t.string "name", null: false
    t.string "stat", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.float "minutes", default: 0.0, null: false
    t.float "ran", default: 0.0, null: false
    t.float "shots", default: 0.0, null: false
    t.float "goals", default: 0.0, null: false
    t.float "assists", default: 0.0, null: false
    t.float "passes", default: 0.0, null: false
    t.float "accurate_passes", default: 0.0, null: false
    t.float "fouls", default: 0.0, null: false
    t.float "offsides", default: 0.0, null: false
    t.float "yellow_cards", default: 0.0, null: false
    t.float "red_cards", default: 0.0, null: false
    t.integer "player_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_statistics_on_match_id"
    t.index ["player_id"], name: "index_statistics_on_player_id"
  end

end
