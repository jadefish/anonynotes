require 'interactor'

module Interactors
  class BestNotes
    prepend ::Interactor

    def initialize(note_repository: Note)
      @note_repo = note_repository
    end

    def call(limit: 10)
      notes = @note_repo
                .order(likes_count: :desc)
                .order(created_at: :desc)
                .limit(limit)
      success(notes)
    end
  end
end
