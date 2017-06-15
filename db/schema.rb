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

ActiveRecord::Schema.define(version: 20170614144356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "register_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "number"
    t.boolean  "status"
  end

  add_index "documents", ["register_id"], name: "index_documents_on_register_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value"
    t.string   "from"
    t.integer  "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "total"
  end

  add_index "evaluations", ["note_id"], name: "index_evaluations_on_note_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "seccion"
    t.string   "max"
    t.string   "turno"
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "teacher_id"
  end

  add_index "groups", ["teacher_id"], name: "index_groups_on_teacher_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.decimal  "parcial1"
    t.decimal  "parcial2"
    t.decimal  "semestre1"
    t.decimal  "parcial3"
    t.decimal  "parcial4"
    t.decimal  "semestre2"
    t.decimal  "nota_final"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_index "notes", ["subject_id"], name: "index_notes_on_subject_id", using: :btree

  create_table "registers", force: :cascade do |t|
    t.string   "year"
    t.string   "colegio_precedencia"
    t.boolean  "pago"
    t.string   "repitente"
    t.string   "extracurricular"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "student_id"
  end

  create_table "schedule_days", force: :cascade do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "dia"
    t.integer  "bloque"
  end

  add_index "schedule_days", ["subject_id"], name: "index_schedule_days_on_subject_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "carnet"
    t.string   "nombre"
    t.string   "nombre1"
    t.string   "apellido"
    t.string   "apellido1"
    t.string   "email"
    t.string   "direction"
    t.integer  "group_id"
    t.integer  "estado"
    t.integer  "note"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "tipo_sangre"
    t.string   "lugar_nac"
    t.date     "fecha_nac"
    t.string   "avatar_file_name"
    t.integer  "avatar_file_size"
    t.string   "avatar_content_type"
    t.datetime "avatar_updated_at"
    t.string   "tel"
  end

  create_table "students_subjects", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "subject_id"
  end

  add_index "students_subjects", ["student_id"], name: "index_students_subjects_on_student_id", using: :btree
  add_index "students_subjects", ["subject_id"], name: "index_students_subjects_on_subject_id", using: :btree

  create_table "students_tutors", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "tutor_id"
  end

  add_index "students_tutors", ["student_id"], name: "index_students_tutors_on_student_id", using: :btree
  add_index "students_tutors", ["tutor_id"], name: "index_students_tutors_on_tutor_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "teacher_id"
  end

  add_index "subjects", ["group_id"], name: "index_subjects_on_group_id", using: :btree
  add_index "subjects", ["teacher_id"], name: "index_subjects_on_teacher_id", using: :btree

  create_table "subjects_teachers", id: false, force: :cascade do |t|
    t.integer "subject_id"
    t.integer "student_id"
  end

  add_index "subjects_teachers", ["student_id"], name: "index_subjects_teachers_on_student_id", using: :btree
  add_index "subjects_teachers", ["subject_id"], name: "index_subjects_teachers_on_subject_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "name1"
    t.string   "lastname"
    t.string   "lastname1"
    t.string   "email"
    t.string   "direction"
    t.date     "fecha_nac"
    t.string   "tipo_id"
    t.string   "cedula"
    t.integer  "cel"
    t.integer  "tel"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_file_size"
    t.string   "image_content_type"
    t.string   "image_updated_at"
  end

  create_table "tel_teachers", force: :cascade do |t|
    t.string   "tipo"
    t.string   "numero"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tel_teachers", ["teacher_id"], name: "index_tel_teachers_on_teacher_id", using: :btree

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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "tipo"
    t.integer  "tipo_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "documents", "registers"
  add_foreign_key "evaluations", "notes"
  add_foreign_key "groups", "teachers"
  add_foreign_key "notes", "subjects"
  add_foreign_key "schedule_days", "subjects"
  add_foreign_key "subjects", "groups"
  add_foreign_key "subjects", "teachers"
  add_foreign_key "tel_teachers", "teachers"
  add_foreign_key "tel_tutors", "tutors"
end
