class Deal < ActiveRecord::Base
  has_many :services
  accepts_nested_attributes_for :services

  belongs_to :beauty_place

  has_one :locatable
  has_one :location, through: :locatable

  validates :title, presence: true
  validates :discount, presence: true
  validates :description, presence: true

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
