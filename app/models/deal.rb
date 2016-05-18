class Deal < ActiveRecord::Base
  has_many :services
  accepts_nested_attributes_for :services

  belongs_to :beauty_place

  has_one :locatable
  has_one :location, through: :locatable

  validates :title, presence: true, length: { minimum: 4 }
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

  def user_id
    beauty_place.user.id
  end

  # def update_attributes(title: nil, description: nil, disount: nil)
  #   self.title = title
  #   self.description = description
  #   self.discount = discount
  # end

end
