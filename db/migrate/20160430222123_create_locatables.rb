class CreateLocatables < ActiveRecord::Migration
  def change
    create_table :locatables do |t|
      t.belongs_to :location, index: true, foreign_key: true
      t.belongs_to :deal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
