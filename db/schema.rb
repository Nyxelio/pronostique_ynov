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

ActiveRecord::Schema.define(version: 20161027091414) do

  create_table "championnats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logo_nomenclatures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "team", null: false
    t.string "img"
  end

  create_table "matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "matchday"
    t.string   "home_team"
    t.float    "home_prevision", limit: 24
    t.integer  "home_score"
    t.float    "draw_prevision", limit: 24
    t.string   "away_team"
    t.float    "away_prevision", limit: 24
    t.integer  "away_score"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "championnat_id"
  end

end
