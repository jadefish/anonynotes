require 'interactor'

module Interactors
  class LikeNote
    prepend ::Interactor

    def initialize(note_repository: Note)
      @note_repo = note_repository
    end

    def call(note:, ip_hash:)
      like = note.likes.find_by(ip_hash: ip_hash)

      # Invariant: a user cannot like the same note more than once.
      if like
        return fail('Cannot like this note again')
      end

      like = note.likes.create!(ip_hash: ip_hash)

      success(like)
    end
  end
end
