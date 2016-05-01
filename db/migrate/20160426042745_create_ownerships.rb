class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :beauty_place, index: true
    end
  end
end
