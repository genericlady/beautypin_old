class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.belongs_to :beauty_place, index: true, foreign_key: true
      t.belongs_to :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
