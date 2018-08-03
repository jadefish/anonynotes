class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :identifier, null: false, uniq: true
      t.text :text, null: false
      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
    add_index :notes, :identifier, unique: true
  end
end
