class User < ActiveRecord::Base

  has_many :ownerships
  has_many :beauty_places, through: :ownerships

  enum role: [:normal, :owner, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :normal
  end

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def address
  end

  def ip
    @ip ||= ip_string_match
  end

  private
  def ip_string_match
    ip_expression.match(get_ip).to_s
  end

  def get_ip
    `curl 'https://api.ipify.org?format=json'`
  end

  def ip_expression
    /\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/
  end

end
