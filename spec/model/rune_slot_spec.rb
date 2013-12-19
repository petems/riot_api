require 'spec_helper'

describe RiotApi::Model::RuneSlot do

  describe '#initialize' do
    let(:data) { { :rune => RiotApi::Model::Rune.new, :rune_slot_id=>28 } }
    let(:rune_slot) { RiotApi::Model::RuneSlot.new data }

    it "should create a valid object" do
      rune_slot.rune_slot_id.should == data[:rune_slot_id]
      rune_slot.rune.should_not be_nil
    end
  end
end

