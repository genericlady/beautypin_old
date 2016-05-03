class AddBeautyPlaceIdToLocatables < ActiveRecord::Migration
  def change
    add_column :locatables, :beauty_place_id, :integer
  end
end
