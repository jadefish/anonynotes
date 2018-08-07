# frozen_string_literal: true

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
    identifier = params[:identifier]
    @note = Note.find(identifier)

    unless @note
      render not_found
      return
    end

    @like = @note.likes.find_by ip_hash: helpers.hashed_ip
    @like_glyph = @like ? '💔' : '❤️'
    @like_title = (@like ? 'Unlike' : 'Like') + ' this note'
  end

  private

  def note_params
    params.require(:note).permit(:text).merge(
      identifier: Note.generate_identifier
    )
  end
end
