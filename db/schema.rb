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

ActiveRecord::Schema.define(version: 2018_08_03_162625) do

  create_table "likes", force: :cascade do |t|
    t.text "ip_hash", null: false
    t.datetime "created_at", null: false
    t.integer "notes_id", null: false
    t.index ["ip_hash", "notes_id"], name: "index_likes_on_ip_hash_and_notes_id", unique: true
    t.index ["notes_id"], name: "index_likes_on_notes_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "identifier", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.index ["identifier"], name: "index_notes_on_identifier", unique: true
  end

end
