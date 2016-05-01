class BeautyPlace < ActiveRecord::Base
  has_many :deals

  has_many :employments
  has_many :employees, through: :employments

  has_one :ownership
  has_one :user, through: :ownership
end
