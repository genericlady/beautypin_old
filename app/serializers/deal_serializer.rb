class DealSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :discount
  has_one :beauty_place
end
