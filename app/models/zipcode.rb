class Zipcode < ApplicationRecord
  def address
    prefecture + city + neighborhood
  end

  def address_kana
    prefecture_kana + city_kana + neighborhood_kana
  end
end
