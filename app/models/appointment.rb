class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :employee

  validates :start_time, presence: true
end
