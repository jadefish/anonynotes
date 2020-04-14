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

ActiveRecord::Schema.define(version: 2018_08_09_024123) do

  create_table "likes", force: :cascade do |t|
    t.text "ip_hash", null: false
    t.datetime "created_at", null: false
    t.integer "note_id", null: false
    t.index ["ip_hash", "note_id"], name: "index_likes_on_ip_hash_and_note_id", unique: true
    t.index ["note_id"], name: "index_likes_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "identifier", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.integer "likes_count", default: 0, null: false
    t.index ["identifier"], name: "index_notes_on_identifier", unique: true
  end

  add_foreign_key "likes", "notes", on_update: :cascade, on_delete: :cascade
end
