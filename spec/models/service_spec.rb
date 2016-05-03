require 'rails_helper'

describe 'Service' do
  subject { create(:service) }
  # title, price, belongs to deal
  it { should have_attributes(title: "5 Blowdry appointments") }
  it { should have_attributes(price: 250) }
  it { should belong_to(:deal) }
  it 'validates with valid data' do
    expect(subject.save).to eq(true)
  end
end
