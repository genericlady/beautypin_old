class Locatable < ActiveRecord::Base
  belongs_to :location
  belongs_to :deal
end
