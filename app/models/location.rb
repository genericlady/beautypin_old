class Location < ActiveRecord::Base
  has_many :locatables
  has_many :deals, through: :locatables

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
