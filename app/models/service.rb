class Service < ActiveRecord::Base
  belongs_to :deal

  validates :title, presence: true
  validates :price, presence: true
end
