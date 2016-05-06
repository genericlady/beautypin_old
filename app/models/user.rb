class User < ActiveRecord::Base
  has_many :ownerships
  has_many :beauty_places, through: :ownerships

  has_many :deals, through: :beauty_places
  has_many :services, through: :deals

  has_many :appointments
  has_many :employees, through: :appointments

  has_many :employees, through: :beauty_places

  has_one :user_location
  has_one :location, through: :user_location

  enum role: [:normal, :owner, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :normal
  end

  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def city
    location.city unless location.nil?
  end

  def state
    location.state unless location.nil?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
