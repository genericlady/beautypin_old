class Deal < ActiveRecord::Base
  has_many :services
  belongs_to :beauty_place

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
