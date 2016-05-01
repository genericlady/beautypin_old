require 'rails_helper'

describe Location.new do
  subject { described_class }

  it { should have_attributes(ip_address: nil) }
  it { should have_attributes(city: nil) }
  it { should have_attributes(state: nil) }
  it { should have_attributes(latitude: nil) }
  it { should have_attributes(longitude: nil) }

  it { should have_many(:locatables) }
  it { should have_many(:deals) }
  it { should have_many(:user_locations) }
  it { should have_many(:users) }
end
