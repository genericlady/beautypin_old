class Deal < ActiveRecord::Base
  has_many :services
  belongs_to :beauty_place
end
