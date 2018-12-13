# frozen_string_literal: true

# SearchController handles search-related actions.
class SearchController < ApplicationController
  def search
    @query = request.query_parameters[:q]
    @results = Note.search(@query)
  end
end
