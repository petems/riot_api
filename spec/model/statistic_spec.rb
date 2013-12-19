require 'spec_helper'

describe RiotApi::Model::Statistic do

  describe '#initialize' do
    let(:data) { { :c => 1, :id => 14, :name => "TOTAL_DEATHS_PER_SESSION", :value => 5 } }
    let(:statistic) { RiotApi::Model::Statistic.new data }

    it "should create a valid object" do
      statistic.c.should == data[:c]
      statistic.count.should == data[:c]
      statistic.id.should == data[:id]
      statistic.name.should == data[:name]
      statistic.value.should == data[:value]
    end
  end
end
