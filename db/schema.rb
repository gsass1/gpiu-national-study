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

ActiveRecord::Schema.define(version: 2020_09_23_201811) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "zip_code"
    t.string "city"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_addresses_on_discarded_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string "iso_2", null: false
    t.string "iso_3", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["iso_2", "iso_3", "name"], name: "index_countries_on_iso_2_and_iso_3_and_name", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.integer "hospital_id", null: false
    t.string "name"
    t.integer "patient_counter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hospital_id", "name"], name: "index_departments_on_hospital_id_and_name", unique: true
    t.index ["hospital_id"], name: "index_departments_on_hospital_id"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.integer "country_id", null: false
    t.integer "address_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_hospitals_on_address_id"
    t.index ["country_id"], name: "index_hospitals_on_country_id"
    t.index ["discarded_at"], name: "index_hospitals_on_discarded_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "study_iterations", force: :cascade do |t|
    t.string "name"
    t.integer "country_id", null: false
    t.integer "acceptance_state"
    t.string "rejection_reason"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_study_iterations_on_country_id"
    t.index ["discarded_at"], name: "index_study_iterations_on_discarded_at"
  end

  create_table "study_ranges", force: :cascade do |t|
    t.date "start"
    t.date "end"
    t.text "comment"
    t.integer "study_iteration_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["study_iteration_id"], name: "index_study_ranges_on_study_iteration_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "title", default: "", null: false
    t.string "suffix", default: ""
    t.integer "country_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "departments", "hospitals"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "users"
  add_foreign_key "hospitals", "addresses"
  add_foreign_key "hospitals", "countries"
  add_foreign_key "study_iterations", "countries"
  add_foreign_key "study_ranges", "study_iterations"
end
