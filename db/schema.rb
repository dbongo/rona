# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_04_112019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "countries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "last_update"
    t.float "lat"
    t.float "long"
    t.integer "confirmed", default: 0
    t.integer "deaths", default: 0
    t.integer "recovered", default: 0
    t.integer "active", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "globe", force: :cascade do |t|
    t.datetime "last_update"
    t.integer "confirmed", default: 0
    t.integer "deaths", default: 0
    t.integer "recovered", default: 0
    t.integer "active", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "fips"
    t.uuid "country_id"
    t.string "name"
    t.datetime "last_update"
    t.float "lat"
    t.float "long"
    t.integer "confirmed", default: 0
    t.integer "deaths", default: 0
    t.integer "recovered", default: 0
    t.integer "active", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_states_on_country_id"
    t.index ["fips"], name: "index_states_on_fips", unique: true
  end

end
