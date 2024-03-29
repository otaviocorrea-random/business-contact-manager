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

ActiveRecord::Schema[7.0].define(version: 2022_08_25_003121) do
  create_table "business_contacts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "kind", default: 0, null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_business_contacts_on_email", unique: true
  end

  create_table "plant_species", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_plant_species_on_name", unique: true
  end

  create_table "plant_species_productive_properties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "plant_specy_id", null: false
    t.bigint "productive_property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_specy_id", "productive_property_id"], name: "plant_species_productive_properties_unique_key", unique: true
    t.index ["plant_specy_id"], name: "plant_specy_on_productive_property_relation"
    t.index ["productive_property_id"], name: "productive_property_on_plant_specy_relation"
  end

  create_table "productive_properties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "business_contact_id", null: false
    t.string "name", null: false
    t.integer "area", null: false
    t.integer "space_between_rows", null: false
    t.integer "space_between_rows_unit", default: 0
    t.integer "space_between_plants", null: false
    t.integer "space_between_plants_unit", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_contact_id"], name: "index_productive_properties_on_business_contact_id"
  end

end
