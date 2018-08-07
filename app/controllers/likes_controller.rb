class LikesController < ApplicationController
  # create handles POST /:note_identifier/like.
  def create
    identifier = params[:note_identifier]

    if not identifier
      render not_found
      return
    end

    @note = Note.find(identifier)

    if not @note
      render not_found
      return
    end

    # Since we're not XHRing, differentiate between liking and unliking notes
    # by checking if the current user has already liked @note:
    like = @note.likes.find_by ip_hash: helpers.hashed_ip

    if like
      # Unlike the note:
      like.delete
    else
      # Like the note:
      @note.likes.create(ip_hash: helpers.hashed_ip)
    end

    redirect_to @note
  end
end
