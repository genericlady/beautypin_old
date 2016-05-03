class AddPublishedToBeautyPlaces < ActiveRecord::Migration
  def change
    add_column :beauty_places, :published, :boolean, default: false
  end
end
