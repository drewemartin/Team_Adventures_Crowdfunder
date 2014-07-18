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

ActiveRecord::Schema.define(version: 20140718024622) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pledges", force: true do |t|
    t.integer  "user_id"
    t.integer  "reward_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pledges", ["reward_id"], name: "index_pledges_on_reward_id"
  add_index "pledges", ["user_id"], name: "index_pledges_on_user_id"

  create_table "projects", force: true do |t|
    t.text     "description"
    t.string   "title"
    t.integer  "goal"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "picture_url"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id"
  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "rewards", force: true do |t|
    t.text     "description"
    t.integer  "amount"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rewards", ["project_id"], name: "index_rewards_on_project_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.text     "biography"
    t.text     "phone"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
