# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160907045838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "students", force: :cascade do |t|
    t.string   "carnet"
    t.string   "nombre"
    t.string   "nombre1"
    t.string   "apellido"
    t.string   "apellido1"
    t.string   "email"
    t.string   "direction"
    t.integer  "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students_tutors", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "tutor_id"
  end

  add_index "students_tutors", ["student_id"], name: "index_students_tutors_on_student_id", using: :btree
  add_index "students_tutors", ["tutor_id"], name: "index_students_tutors_on_tutor_id", using: :btree

  create_table "tel_tutors", force: :cascade do |t|
    t.string   "tipo"
    t.integer  "numero"
    t.integer  "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tel_tutors", ["tutor_id"], name: "index_tel_tutors_on_tutor_id", using: :btree

  create_table "tutors", force: :cascade do |t|
    t.string   "tipo_id"
    t.string   "cedula"
    t.string   "first"
    t.string   "second"
    t.string   "apellido"
    t.string   "apellido1"
    t.string   "tipotutor"
    t.string   "email"
    t.string   "direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "tel_tutors", "tutors"
end
