class AddDealIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :deal_id, :integer, index: true
  end
end
