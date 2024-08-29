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

ActiveRecord::Schema[7.1].define(version: 2024_08_29_134841) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_administrators", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "admin_categories", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_users", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "cpf"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_users_courses", force: :cascade do |t|
    t.bigint "client_users_id", null: false
    t.bigint "sales_courses_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_users_id"], name: "index_client_users_courses_on_client_users_id"
    t.index ["sales_courses_id"], name: "index_client_users_courses_on_sales_courses_id"
  end

  create_table "sales_addresses", force: :cascade do |t|
    t.string "rua"
    t.string "numero"
    t.string "bairro"
    t.string "cep"
    t.string "estado"
    t.bigint "sales_sellers_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_sellers_id"], name: "index_sales_addresses_on_sales_sellers_id"
  end

  create_table "sales_bank_accounts", force: :cascade do |t|
    t.integer "numero"
    t.integer "agencia"
    t.string "banco"
    t.bigint "sales_sellers_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_sellers_id"], name: "index_sales_bank_accounts_on_sales_sellers_id"
  end

  create_table "sales_courses", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sales_sellers_id", null: false
    t.bigint "admin_categories_id", null: false
    t.decimal "preco"
    t.index ["admin_categories_id"], name: "index_sales_courses_on_admin_categories_id"
    t.index ["sales_sellers_id"], name: "index_sales_courses_on_sales_sellers_id"
  end

  create_table "sales_sellers", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_videos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "link"
    t.bigint "sales_courses_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "embed"
    t.index ["sales_courses_id"], name: "index_sales_videos_on_sales_courses_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "client_users_courses", "client_users", column: "client_users_id"
  add_foreign_key "client_users_courses", "sales_courses", column: "sales_courses_id"
  add_foreign_key "sales_addresses", "sales_sellers", column: "sales_sellers_id"
  add_foreign_key "sales_bank_accounts", "sales_sellers", column: "sales_sellers_id"
  add_foreign_key "sales_courses", "admin_categories", column: "admin_categories_id"
  add_foreign_key "sales_courses", "sales_sellers", column: "sales_sellers_id"
  add_foreign_key "sales_videos", "sales_courses", column: "sales_courses_id"
end
