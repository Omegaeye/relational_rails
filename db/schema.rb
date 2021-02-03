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

ActiveRecord::Schema.define(version: 2021_02_03_005217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "level"
    t.boolean "alive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mounts", force: :cascade do |t|
    t.string "name"
    t.integer "heroes_id"
    t.integer "level"
    t.boolean "fly"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.integer "age"
    t.boolean "starter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "rank"
    t.boolean "first_place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
