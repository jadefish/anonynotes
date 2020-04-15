class IndexController < ApplicationController
  def index
    result = Interactors::NewNotes.new.call
    @new_notes = result.unwrap_or_else { |err| render_error(err) }

    result = Interactors::BestNotes.new.call
    @best_notes = result.unwrap_or_else { |err| render_error(err) }
  end
end
