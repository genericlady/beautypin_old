require 'rails_helper'

describe 'Service' do
  subject { build_stubbed(:service) }
    # title, price, belongs to deal
  it { should have_attributes(title: "5 Blowdry appointments") }
  it { should have_attributes(price: 250) }
  it { should belong_to(:deal) }
end
