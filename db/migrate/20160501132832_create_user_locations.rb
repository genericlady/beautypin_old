class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.belongs_to :location, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
