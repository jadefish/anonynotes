class NotesController < ApplicationController
  def new
    @note = Note.new
    @like = Like.new
  end

  def create
    result = ::Interactors::CreateNote.new.call(
      attributes: note_params.to_hash,
      ip_hash: hashed_ip
    )
    @note = result.unwrap_or_else { |err| render_error(err) } or return

    redirect_to @note
  end

  def show
    result = ::Interactors::FindNote.new.call(identifier: params[:identifier])
    @note = result.unwrap_or_else { |err| render_error(err) }

    @like = @note.likes.find_by(ip_hash: hashed_ip)
  end

  private

  def note_params
    params
      .require(:note)
      .permit(:text)
      .merge(identifier: Note.generate_identifier)
  end

  def hashed_ip
    helpers.hashed_ip # TODO: refactor
  end
end
