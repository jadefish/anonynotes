# frozen_string_literal: true

# NotesIndex is a service used to obtain a connection to the full-text index
# for Notes.
class NotesIndex
  include Singleton

  def initialize
    @db = FtsLite::Index.open(
      Rails.application.config.database_configuration[Rails.env]['database'],
      table_name: Rails.application.config.notes_search_index_table_name,
      tokenizer: :simple
    )
  end

  # search the index for `query` using `options`.
  def search(query, options = {})
    @db.search(query, options)
  end

  # add or update the index with `note`.
  def set(note)
    @db.set(note.id, note.text, note.likes_count)
  end
end
