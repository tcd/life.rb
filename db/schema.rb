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

ActiveRecord::Schema.define(version: 2020_09_16_023635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "bookmarks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "source"
    t.string "title"
    t.string "description"
    t.text "icon"
    t.string "url", null: false
    t.string "tags", default: [], array: true
    t.string "folders", default: [], array: true
    t.datetime "folder_name_date"
    t.datetime "created_on_browser_at"
    t.datetime "updated_on_browser_at"
    t.jsonb "metadata", default: "{}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.tsvector "tsv"
    t.index ["tsv"], name: "index_bookmarks_on_tsv", using: :gin
  end

  create_table "mojis", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "personal_name"
    t.string "emoji"
    t.string "group"
    t.string "sub_group"
    t.string "unicode_version"
    t.string "emoji_version"
    t.string "aliases", default: [], array: true
    t.string "tags", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.string "unicode_code_point"
    t.string "unicode_code_points", default: [], array: true
    t.string "unicode_name"
    t.string "status"
    t.float "unicode_version_float"
    t.float "emoji_version_float"
  end

  create_table "snippets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "content", null: false
    t.string "trigger"
    t.boolean "emoji"
    t.boolean "textmate"
    t.string "for_use_with", default: [], array: true
    t.jsonb "metadata", default: "{}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tracked_times", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "description"
    t.string "source"
    t.datetime "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "hours"
    t.integer "minutes"
    t.integer "seconds"
    t.jsonb "metadata", default: "{}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "timezone"
    t.string "employer"
    t.string "client"
    t.string "project"
    t.string "task"
    t.integer "total_seconds"
  end

end
