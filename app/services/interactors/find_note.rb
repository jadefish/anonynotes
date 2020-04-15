require 'interactor'

module Interactors
  class FindNote
    prepend ::Interactor

    def initialize(note_repository: Note)
      @note_repo = note_repository
    end

    def call(identifier:)
      note = @note_repo.find_by(identifier: identifier)

      if note
        success(note)
      else
        fail("Couldn't find note")
      end
    end
  end
end
