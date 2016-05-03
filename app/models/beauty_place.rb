class BeautyPlace < ActiveRecord::Base
  has_many :deals
  has_many :services, through: :deals

  has_many :employments
  has_many :employees, through: :employments

  has_one :ownership
  has_one :user, through: :ownership

  # has_one :beauty_place_location
  # has_one :location, through: :beauty_place_location

  has_one :locatable
  has_one :location, through: :locatable

  validates :name, presence: true

  def city
    location.city
  end

  def state
    location.state
  end
end
