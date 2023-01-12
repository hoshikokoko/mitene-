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

ActiveRecord::Schema.define(version: 2023_01_12_074748) do

  create_table "bookmarks", force: :cascade do |t|
    t.integer "staff_id", null: false
    t.integer "infomation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "imfomations", force: :cascade do |t|
    t.integer "staff_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.boolean "priority", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "infomation_comments", force: :cascade do |t|
    t.integer "staff_id", null: false
    t.integer "infomation_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "infomation_id", null: false
    t.integer "infomation_comment_id", null: false
    t.integer "visiter_id", null: false
    t.integer "visited_id", null: false
    t.integer "action", null: false
    t.boolean "is_checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reads", force: :cascade do |t|
    t.integer "staff_id", null: false
    t.integer "infomation_id", null: false
    t.boolean "is_completed", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
