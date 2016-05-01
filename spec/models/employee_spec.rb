require 'rails_helper'

describe Employee.new do
  subject { described_class }

  it { should have_attributes(name: nil) }
  it 'will not pass validations' do
    expect(subject.save).to eq(false)
  end

  it { should have_one(:employment) }
  it { should have_one(:beauty_place).through(:employment) }

  it { should have_many(:appointments) }
  it { should have_many(:users).through(:appointments) }
end
