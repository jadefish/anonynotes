class NotesController < ApplicationController
  # new handles GET /new.
  def new
    @note = Note.new
  end

  # create handles POST /new.
  def create
    @note = Note.create(note_params)
    @note.likes.create(ip_hash: helpers.hashed_ip)

    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  # show handles GET /:identifier.
  def show
    # TODO
  end

  private
    def note_params
      params.require(:note).permit(:text).merge(
        identifier: Note.generate_identifier
      )
    end
end
