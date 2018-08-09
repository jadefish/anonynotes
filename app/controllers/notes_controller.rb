# frozen_string_literal: true

class NotesController < ApplicationController
  # new handles GET /new.
  def new
    @note = Note.new
  end

  # create handles POST /new.
  def create
    Note.transaction do
      @note = Note.create! note_params
      @like = @note.likes.create! ip_hash: helpers.hashed_ip
    end

    redirect_to @note
  end

  # show handles GET /:identifier.
  def show
    @note = Note.find_by! identifier: params[:identifier]
    @like = @note.likes.find_by ip_hash: helpers.hashed_ip
  end

  private

  def note_params
    params.require(:note).permit(:text).merge(
      identifier: Note.generate_identifier
    )
  end
end
