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

ActiveRecord::Schema[7.0].define(version: 2022_11_21_001429) do
  create_table "lab_studies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "result_id"
    t.string "code", null: false
    t.string "name", null: false
    t.string "reference_range", null: false
    t.string "observation_value", null: false
    t.boolean "normal", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_id"], name: "index_lab_studies_on_result_id"
  end

  create_table "patients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "nationality", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "ic_number", null: false
    t.integer "gender", null: false
    t.timestamp "birth_of_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "lab_id", null: false
    t.string "lab_code", null: false
    t.timestamp "tested_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_results_on_patient_id"
  end

  add_foreign_key "lab_studies", "results"
  add_foreign_key "results", "patients"
end
