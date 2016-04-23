class AddBeautyPlaceIdToDeal < ActiveRecord::Migration
  def change
    add_column :deals, :beauty_place_id, :integer, index: true
  end
end
