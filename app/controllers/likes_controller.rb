class LikesController < ApplicationController
  def create
    result = Interactors::FindNote.new.call(identifier: params[:note_identifier])
    @note = result.unwrap_or_else { |err| render_error(err) }

    hashed_ip = helpers.hashed_ip # TODO: refactor

    result = Interactors::LikeNote.new.call(note: @note, ip_hash: hashed_ip)
    @like = result.unwrap_or_else { |err| render_error(err) }

    redirect_to @note
  end
end
