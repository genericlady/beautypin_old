class BeautyPlace < ActiveRecord::Base
  has_many :deals
  has_many :services, through: :deals

  has_many :employments
  has_many :employees, through: :employments

  has_one :ownership
  has_one :user, through: :ownership

  has_one :locatable
  has_one :location, through: :locatable

  accepts_nested_attributes_for :employees, reject_if: :all_blank
  accepts_nested_attributes_for :services, reject_if: :all_blank
  accepts_nested_attributes_for :location, reject_if: :all_blank
  accepts_nested_attributes_for :deals, reject_if: :all_blank

  validates :name, presence: true, length: { minimum: 4 }
  validates :name, uniqueness: true

  def city
    location.city
  end

  def state
    location.state
  end

  def address
    location.address
  end

  def location_attributes=(attributes = {})
    if self.new_record?
      self.location = Location.new attributes
    else
      location.update attributes
    end
  end

end
