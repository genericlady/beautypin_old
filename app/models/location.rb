class Location < ActiveRecord::Base
  has_many :locatables
  has_many :deals, through: :locatables

  has_many :user_locations
  has_many :users, through: :user_locations

  has_many :beauty_place_locations
  has_many :locations, through: :beauty_place_locations

  geocoded_by :ip_address
  # NOTE: find a hook suitable for set_ip
  after_validation :geocode, if: :ip_address_changed?

  validates :city, presence: true
  validates :state, presence: true
  # validates :latitude, presence: true
  # validates :longitude, presence: true

  def set_attributes
    set_ip
    self.city = geocode.city
    self.state = geocode.state
    self.latitude = geocode.lat
    self.longitude = geocode.lng
    self
  end

  def geocode
    @geocode ||= Geokit::Geocoders::MultiGeocoder.geocode(ip_address)
  end

  def set_ip
    self.ip_address = ip_stringify
    # self.save
  end

  private
  def ip_stringify
    ip_expression.match(fetch_ip).to_s
  end

  def fetch_ip
    `curl 'https://api.ipify.org?format=json'`
  end

  def ip_expression
    /\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/
  end

end
