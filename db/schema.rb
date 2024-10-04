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

ActiveRecord::Schema[7.2].define(version: 2024_10_04_143825) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "custom_form_inputs", force: :cascade do |t|
    t.string "label"
    t.boolean "required"
    t.integer "max_length"
    t.string "placeholder"
    t.integer "kind"
    t.string "options"
    t.bigint "custom_form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_form_id"], name: "index_custom_form_inputs_on_custom_form_id"
  end

  create_table "custom_forms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "form_answers", force: :cascade do |t|
    t.bigint "custom_form_input_id", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_form_input_id"], name: "index_form_answers_on_custom_form_input_id"
  end

  add_foreign_key "custom_form_inputs", "custom_forms"
  add_foreign_key "form_answers", "custom_form_inputs"
end
