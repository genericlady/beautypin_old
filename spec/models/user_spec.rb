require 'rails_helper'

describe User.new do

  it { should have_attributes location: nil }
  it { should have_many :appointments }
  it { should have_many(:employees).through(:appointments) }

end
