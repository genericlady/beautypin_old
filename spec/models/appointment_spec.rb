require 'rails_helper'

describe Appointment.new do

  it { should have_attributes(start_time: nil)}
  it 'should not be able to validate with invalid start_time' do
    expect(described_class.save).to eq(false)
  end

  it 'the attribute of time is of the Time class' do
    right_now = Time.new
    described_class.start_time = right_now
    expect(described_class.start_time).to be_kind_of(Time)
  end

  it { should belong_to :employee }
  it { should belong_to :user }

end
