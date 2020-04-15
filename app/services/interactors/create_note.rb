require 'interactor'

module Interactors
  class CreateNote
    prepend ::Interactor

    def initialize(note_repository: Note)
      @note_repo = note_repository
    end

    def call(attributes:, ip_hash:)
      note = @note_repo.create!(attributes)
      note.likes.create!(ip_hash: ip_hash)

      success(note)
    end
  end
end
