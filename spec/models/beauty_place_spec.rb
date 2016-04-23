require 'rails_helper'

describe 'Beauty Place Attribute Testing' do
  subject { BeautyPlace.new(name: 'Lotus Lady Spa') }

  describe 'New beauty place has a name' do
    it { is_expected.to have_attributes(name: 'Lotus Lady Spa') }
  end
end
