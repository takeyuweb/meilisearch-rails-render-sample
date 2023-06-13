require 'nkf'

class Zipcode < ApplicationRecord
  include MeiliSearch::Rails
  extend Pagy::Meilisearch

  meilisearch do
    attribute :code, :address, :address_kana, :address_hiragana

    ranking_rules %w[
      exactness
      words
      typo
      proximity
      sort
    ]
  end

  def address
    prefecture + city + neighborhood
  end

  def address_kana
    prefecture_kana + city_kana + neighborhood_kana
  end

  def address_hiragana
    NKF.nkf('-W -w --hiragana', address_kana)
  end

  def will_save_change_to_address?
    will_save_change_to_prefecture? || will_save_change_to_city? || will_save_change_to_neighborhood?
  end

  def will_save_change_to_address_kana?
    will_save_change_to_prefecture_kana? || will_save_change_to_city_kana? || will_save_change_to_neighborhood_kana?
  end

  def will_save_change_to_address_hiragana?
    will_save_change_to_address_kana?
  end
end
