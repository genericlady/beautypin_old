class BeautyPlaceSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :deals
  has_one :location
end
