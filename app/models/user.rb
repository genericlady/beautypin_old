class User < ActiveRecord::Base

  has_many :ownerships
  has_many :beauty_places, through: :ownerships

  has_many :appointments
  has_many :employees, through: :appointments

  has_one :user_location
  has_one :location, through: :user_location

  enum role: [:normal, :owner, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :normal
  end

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def city
    location.city unless location.nil?
  end

  def state
    location.state unless location.nil?
  end

end
