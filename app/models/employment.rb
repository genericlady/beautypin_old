class Employment < ActiveRecord::Base
  belongs_to :beauty_place
  belongs_to :employee
end
