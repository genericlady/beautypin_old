class CreateBeautyPlaceLocations < ActiveRecord::Migration
  def change
    create_table :beauty_place_locations do |t|
      t.belongs_to :beauty_place, index: true
      t.belongs_to :location, index: true
      
      t.timestamps null: false
    end
  end
end
