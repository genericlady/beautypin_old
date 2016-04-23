require 'rails_helper'

describe 'Deal Attribute' do
  subject { build_stubbed(:deal) }

  context 'New deal has title, description and price' do
    it { is_expected.to have_attributes(title: "5 mani pedi spa package") }
    it { is_expected.to have_attributes(description: "Green Tea Spa Special with Hibiscus") }
    it { is_expected.to have_attributes(discount: 100) }
  end

end

describe 'Deal Relationships' do
  subject { build_stubbed(:deal) }

  context 'belongs to a beauty place' do
    it { should belong_to(:beauty_place) }
  end

  context 'has many services' do
    it { should have_many(:services) }
  end

end
