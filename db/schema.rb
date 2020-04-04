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

ActiveRecord::Schema.define(version: 2020_04_04_004817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "global_cases", force: :cascade do |t|
    t.string "fips", limit: 5
    t.string "county_name"
    t.string "province_state"
    t.string "country_region", null: false
    t.date "last_update"
    t.float "latitude"
    t.float "longitude"
    t.integer "confirmed", default: 0
    t.integer "deaths", default: 0
    t.integer "recovered", default: 0
    t.integer "active", default: 0
    t.string "combined_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fips"], name: "index_global_cases_on_fips", unique: true
  end

end
