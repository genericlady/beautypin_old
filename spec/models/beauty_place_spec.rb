require 'rails_helper'

describe 'Beauty Place' do
  subject { build_stubbed(:beauty_place) }

  context 'New beauty place has a name' do
    it { should have_attributes(name: 'Lotus Lady Spa') }
  end

  context 'has many deals' do
    it { should have_many(:deals) }
  end

end
