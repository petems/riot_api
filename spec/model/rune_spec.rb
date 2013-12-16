require 'spec_helper'

describe RiotApi::Model::Rune do

  describe '#initialize' do
    let(:data) { {id:5289, name:"Greater Glyph of Magic Resist", description:"+1.34 magic resist", tier:3} }
    let(:rune) { RiotApi::Model::Rune.new data }

    it "should create a valid object" do
      rune.id.should == data[:id]
      rune.name.should == data[:name]
      rune.description.should == data[:description]
      rune.tier.should == data[:tier]
    end
  end
end

