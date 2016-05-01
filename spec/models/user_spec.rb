require 'rails_helper'

describe User.new do
  # subject { described_class }

  it { should respond_to :ip }
end
