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

ActiveRecord::Schema.define(version: 20160917025457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_skills", force: :cascade do |t|
    t.integer  "job_id",                 null: false
    t.integer  "skill_id",               null: false
    t.integer  "sequence",   default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["job_id", "sequence"], name: "index_job_skills_on_job_id_and_sequence", unique: true, using: :btree
    t.index ["job_id", "skill_id"], name: "index_job_skills_on_job_id_and_skill_id", unique: true, using: :btree
    t.index ["job_id"], name: "index_job_skills_on_job_id", using: :btree
    t.index ["skill_id"], name: "index_job_skills_on_skill_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "company_name",    null: false
    t.string   "company_website"
    t.string   "title",           null: false
    t.text     "description"
    t.date     "start_date",      null: false
    t.date     "end_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "project_skills", force: :cascade do |t|
    t.integer  "project_id",             null: false
    t.integer  "skill_id",               null: false
    t.integer  "sequence",   default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["project_id", "sequence"], name: "index_project_skills_on_project_id_and_sequence", unique: true, using: :btree
    t.index ["project_id", "skill_id"], name: "index_project_skills_on_project_id_and_skill_id", unique: true, using: :btree
    t.index ["project_id"], name: "index_project_skills_on_project_id", using: :btree
    t.index ["skill_id"], name: "index_project_skills_on_skill_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "website"
    t.text     "description"
    t.integer  "project_year", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "parent_id"
    t.integer  "sequence",   default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["name"], name: "index_skills_on_name", unique: true, using: :btree
    t.index ["parent_id", "sequence"], name: "index_skills_on_parent_id_and_sequence", unique: true, using: :btree
    t.index ["parent_id"], name: "index_skills_on_parent_id", using: :btree
  end

  add_foreign_key "job_skills", "jobs"
  add_foreign_key "job_skills", "skills"
  add_foreign_key "project_skills", "projects"
  add_foreign_key "project_skills", "skills"
end
