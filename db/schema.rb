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

ActiveRecord::Schema[7.0].define(version: 2024_03_07_142557) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.float "proteins"
    t.float "fats"
    t.float "carbohydrates"
    t.integer "cal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "dish_weight"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dish_id", null: false
    t.index ["dish_id"], name: "index_meals_on_dish_id"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "normpfcs", force: :cascade do |t|
    t.float "genus"
    t.float "age"
    t.float "height"
    t.float "weight"
    t.float "kof_activ"
    t.float "rezult"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_normpfcs_on_user_id"
  end

  create_table "person_characteristics", force: :cascade do |t|
    t.integer "genus"
    t.integer "age"
    t.integer "height"
    t.integer "weight"
    t.float "kof_activ"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_person_characteristics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "meals", "dishes"
  add_foreign_key "meals", "users"
  add_foreign_key "normpfcs", "users"
  add_foreign_key "person_characteristics", "users"
end
