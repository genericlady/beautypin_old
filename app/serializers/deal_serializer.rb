class DealSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :discount
end
