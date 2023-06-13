class CreateZipcodes < ActiveRecord::Migration[7.0]
  def change
    create_table :zipcodes do |t|
      t.string :code
      t.string :prefecture
      t.string :city
      t.string :neighborhood
      t.string :prefecture_kana
      t.string :city_kana
      t.string :neighborhood_kana

      t.timestamps
    end
  end
end
