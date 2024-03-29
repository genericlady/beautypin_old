class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.integer :discount, limit: 100
      t.timestamps null: false
    end
  end
end
