class SearchController < ApplicationController
  def search
    @results = []
    @query = request.query_parameters[:q]
  end
end
