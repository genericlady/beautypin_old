class BeautyPlaceLocation < ActiveRecord::Base
  belongs_to :beauty_place
  belongs_to :location
end
