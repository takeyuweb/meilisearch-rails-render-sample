# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
require 'nkf'

def han2zen(str)
  NKF::nkf('-WwXm0', str)
end

now = Time.current
zipcodes = []

CSV.foreach(Rails.root.join("db/x-ken-all.csv").to_s, encoding: Encoding::SJIS) do |row|
  code = row[2]
  prefecture_kana = han2zen(row[3])
  city_kana = han2zen(row[4])
  neighborhood_kana = han2zen(row[5])
  prefecture = row[6]
  city = row[7]
  neighborhood = row[8]

  zipcodes.push({
    code:,
    prefecture:,
    city:,
    neighborhood:,
    prefecture_kana:,
    city_kana:,
    neighborhood_kana:,
    created_at: now,
    updated_at: now
  })
end

Zipcode.upsert_all(zipcodes)
