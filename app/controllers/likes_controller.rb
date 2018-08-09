class LikesController < ApplicationController
  # create handles POST /:note_identifier/like.
  def create
    @note = Note.find_by identifier: params[:note_identifier]
    @like = @note.likes.find_or_create_by ip_hash: helpers.hashed_ip

    redirect_to @note
  end
end
