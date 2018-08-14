# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    @results = []
    @query = request.query_parameters[:q]
  end
end
