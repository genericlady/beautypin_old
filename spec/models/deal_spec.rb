require 'rails_helper'

describe 'Deal Attribute Testing' do
  describe 'New deal has title, description and price' do
    subject { Deal.new(title: "5 mani pedi spa package",
                    description: "Green Tea Spa Special with Hibiscus",
                    price: 100.00) }

    it { is_expected.to have_attributes(title: "5 mani pedi spa package") }
    it { is_expected.to have_attributes(description: "Green Tea Spa Special with Hibiscus") }
    it { is_expected.to have_attributes(price: 100.00) }

  end
end
