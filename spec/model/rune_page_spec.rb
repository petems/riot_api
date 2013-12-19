require 'spec_helper'

describe RiotApi::Model::RunePage do

  describe '#initialize' do
    let(:data) { { :current => false, :id => 16220664, :name => "Tank", :slots => [RiotApi::Model::RuneSlot.new] } }
    let(:rune_page) { RiotApi::Model::RunePage.new data }

    it "should create a valid object" do
      rune_page.id.should == data[:id]
      rune_page.slots.should_not be_empty
      rune_page.slots.first.class.should == RiotApi::Model::RuneSlot
    end
  end
end

