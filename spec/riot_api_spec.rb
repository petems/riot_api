require 'spec_helper'

describe RiotApi do
  it 'should have a version number' do
    RiotApi::VERSION.should_not be_nil
  end
end
