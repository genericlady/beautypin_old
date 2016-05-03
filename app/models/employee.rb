class Employee < ActiveRecord::Base
  has_one :employment
  has_one :beauty_place, through: :employment
  has_one :user, through: :beauty_place

  has_many :appointments
  has_many :users, through: :appointments

  validates :name, presence: true
end
