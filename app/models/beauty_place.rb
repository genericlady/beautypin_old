class BeautyPlace < ActiveRecord::Base
  has_many :deals
  has_one :ownership
  has_one :user, through: :ownership
end
