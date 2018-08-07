class LikesController < ApplicationController
  # create handles POST /:note_identifier/like.
  def create
    identifier = params[:note_identifier]
    @note = Note.find(identifier)

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
