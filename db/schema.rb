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

ActiveRecord::Schema.define(version: 2020_09_25_020715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "bank", null: false
    t.string "account_number", null: false
    t.string "name"
    t.boolean "credit", default: false
    t.boolean "debit", default: false
    t.boolean "checking", default: false
    t.boolean "savings", default: false
    t.jsonb "metadata", default: "{}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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

  create_table "merchants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "official_name"
    t.string "description"
    t.string "category"
    t.string "website"
    t.jsonb "metadata", default: "{}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_merchants_on_name", unique: true
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
    t.string "github_shortcode"
    t.string "slack_shortcode"
    t.string "teams_shortcode"
    t.string "personal_shortcode"
  end

  create_table "payment_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_payment_categories_on_name", unique: true
  end

  create_table "payment_payment_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "payment_id"
    t.uuid "payment_category_id"
    t.index ["payment_category_id"], name: "index_payment_payment_categories_on_payment_category_id"
    t.index ["payment_id"], name: "index_payment_payment_categories_on_payment_id"
  end

  create_table "payments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "person_id"
    t.uuid "merchant_id"
    t.uuid "account_id"
    t.integer "credit_cents", default: 0, null: false
    t.string "credit_currency", default: "USD", null: false
    t.integer "debit_cents", default: 0, null: false
    t.string "debit_currency", default: "USD", null: false
    t.string "name"
    t.string "category"
    t.string "contact"
    t.string "description"
    t.boolean "work_expense", default: false
    t.boolean "subscription", default: false
    t.boolean "refunded", default: false
    t.date "charge_date"
    t.date "transaction_date"
    t.datetime "charge_timestamp"
    t.datetime "transaction_timestamp"
    t.jsonb "metadata", default: "{}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_payments_on_account_id"
    t.index ["merchant_id"], name: "index_payments_on_merchant_id"
    t.index ["person_id"], name: "index_payments_on_person_id"
  end

  create_table "people", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "payment_payment_categories", "payment_categories"
  add_foreign_key "payment_payment_categories", "payments"
  add_foreign_key "payments", "accounts"
  add_foreign_key "payments", "merchants"
  add_foreign_key "payments", "people"
end
