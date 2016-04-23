class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 5, scale: 2
      
      t.timestamps null: false
    end
  end
end
