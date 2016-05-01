class Employee < ActiveRecord::Base
  belongs_to :beauty_place
  has_many :users, through: :appointments
end
