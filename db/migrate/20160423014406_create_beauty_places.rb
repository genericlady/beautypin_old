class CreateBeautyPlaces < ActiveRecord::Migration
  def change
    create_table :beauty_places do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
