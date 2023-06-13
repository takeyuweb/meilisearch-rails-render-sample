class ZipcodesController < ApplicationController
  include Pagy::Backend

  def index
    @query = params[:query]
    if @query.present?
      zipcodes = Zipcode.pagy_search(@query)
      @pagy, @zipcodes = pagy_meilisearch(zipcodes)
    else
      zipcodes = Zipcode.none
      @pagy, @zipcodes = pagy(zipcodes)
    end
  end
end
