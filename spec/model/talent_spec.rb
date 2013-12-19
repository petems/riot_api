require 'spec_helper'

describe RiotApi::Model::Talent do

  describe '#initialize' do
    let(:data) { { id: 4212, name: "Recovery",  rank: 2 } }
    let(:rune) { RiotApi::Model::Talent.new data }

    it "should create a valid object" do
      rune.id.should == data[:id]
      rune.name.should == data[:name]
      rune.rank.should == data[:rank]
    end
  end
end

