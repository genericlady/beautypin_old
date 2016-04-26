class AddUserIdToBeautyPlaces < ActiveRecord::Migration
  def change
    add_column :beauty_places, :owner_id, :integer, index: true
  end
end
