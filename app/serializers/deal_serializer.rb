class DealSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :discount
  belongs_to :beauty_place_id, key: :shit
  # belongs_to :beauty_place
  # has_one :beauty_place
end
