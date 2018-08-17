class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.text :ip_hash, null: false
      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.belongs_to :note, null: false, index: true, foreign_key: { on_update: :cascade, on_delete: :cascade }
    end

    add_index :likes, [:ip_hash, 'note_id'], unique: true
  end
end
