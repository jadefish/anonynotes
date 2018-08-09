# frozen_string_literal: true

# IndexController renders index-related pages.
class IndexController < ApplicationController
  def index
    @new_notes = Note.newest
    @best_notes = Note.best
  end
end
