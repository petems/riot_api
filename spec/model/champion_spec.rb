require 'spec_helper'

describe RiotApi::Model::Champion do

  describe '#initialize' do
    let(:data) { { active:true, attack_rank:3, bot_enabled:false, bot_mm_enabled:false, defense_rank:4, difficulty_rank:8, free_to_play:false, id:103, magic_rank:8, name:"Ahri", ranked_play_enabled:true } }
    let(:champion) { RiotApi::Model::Champion.new data }

    it "should create a valid object" do
      champion.id.should == data[:id]
      champion.name.should == data[:name]
    end
  end
end