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

ActiveRecord::Schema[7.1].define(version: 2024_08_22_143947) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_addresses", force: :cascade do |t|
    t.string "rua"
    t.string "numero"
    t.string "bairro"
    t.string "cep"
    t.string "estado"
    t.bigint "admin_administrators_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_administrators_id"], name: "index_admin_addresses_on_admin_administrators_id"
  end

  create_table "admin_administrators", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_bank_accounts", force: :cascade do |t|
    t.integer "numero"
    t.integer "agencia"
    t.string "banco"
    t.bigint "admin_administrators_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_administrators_id"], name: "index_admin_bank_accounts_on_admin_administrators_id"
  end

  add_foreign_key "admin_addresses", "admin_administrators", column: "admin_administrators_id"
  add_foreign_key "admin_bank_accounts", "admin_administrators", column: "admin_administrators_id"
end
