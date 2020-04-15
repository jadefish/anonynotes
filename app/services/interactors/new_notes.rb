require 'interactor'

module Interactors
  class NewNotes
    prepend ::Interactor

    def initialize(note_repository: Note)
      @note_repo = note_repository
    end

    def call(limit: 10)
      notes = @note_repo.order(created_at: :desc).limit(limit)
      success(notes)
    end
  end
end
