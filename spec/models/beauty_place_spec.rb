require 'rails_helper'

describe BeautyPlace.new do
  subject { described_class }

  it { should have_attributes(name: nil) }
  it { should have_many(:deals) }
  it { should have_many(:employees) }
  
end
