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

ActiveRecord::Schema[7.0].define(version: 2023_06_03_153549) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_employees_on_role_id"
  end

  create_table "payslip_details", force: :cascade do |t|
    t.string "description"
    t.decimal "quantity"
    t.decimal "total", precision: 10, scale: 2
    t.bigint "salary_detail_id", null: false
    t.bigint "payslip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payslip_id"], name: "index_payslip_details_on_payslip_id"
    t.index ["salary_detail_id"], name: "index_payslip_details_on_salary_detail_id"
  end

  create_table "payslips", force: :cascade do |t|
    t.decimal "total", precision: 10, scale: 2
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_payslips_on_employee_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salary_details", force: :cascade do |t|
    t.string "name"
    t.decimal "value", precision: 10, scale: 2
    t.decimal "conditional_value"
    t.boolean "is_quantity"
    t.boolean "is_discount"
    t.boolean "is_main"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_salary_details_on_role_id"
  end

  add_foreign_key "employees", "roles"
  add_foreign_key "payslip_details", "payslips"
  add_foreign_key "payslip_details", "salary_details"
  add_foreign_key "payslips", "employees"
  add_foreign_key "salary_details", "roles"
end
