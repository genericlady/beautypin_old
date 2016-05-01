class Deal < ActiveRecord::Base
  has_many :services

  has_one :deal_beauty_place
  has_one :beauty_place, through: :deal_beauty_place

  # belongs_to :beauty_place
  # has_one :beauty_place

  has_one :locatable
  has_one :location, through: :locatable

  def self.policy_class
    DealPolicy
  end

  def self.search(search)
    if search
      where("title like ?", "%#{search}%")
    else
      find(:all)
    end
  end

end
