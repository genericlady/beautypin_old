class User < ActiveRecord::Base
  enum role: [:normal, :owner, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :normal
  end

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :owner, :polymorphic => true

end
