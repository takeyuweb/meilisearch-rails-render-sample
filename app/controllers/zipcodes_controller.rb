class ZipcodesController < ApplicationController
  def index
    @query = params[:query]
    if @query.present?
      expression = "%#{ApplicationRecord.sanitize_sql_like(@query)}%"
      @zipcodes = Zipcode.where("code LIKE ?", expression)
        .or(Zipcode.where("prefecture || city || neighborhood LIKE ?", expression))
        .or(Zipcode.where("prefecture_kana || city_kana || neighborhood_kana LIKE ?", expression))
        .limit(30)
    else
      @zipcodes = Zipcode.none
    end
  end
end
