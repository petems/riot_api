require 'spec_helper'

describe RiotApi::Model::LeagueEntry do

  describe '#initialize' do
    let(:data) { {"player_or_team_id"=>"7460", "player_or_team_name"=>"Chaox", "league_name"=>"Wukong's Lancers", "queue_type"=>"RANKED_SOLO_5x5", "tier"=>"CHALLENGER", "rank"=>"I", "league_points"=>204, "wins"=>919, "losses"=>866, "is_hot_streak"=>false, "is_veteran"=>false, "is_fresh_blood"=>false, "is_inactive"=>false, "last_played"=>0, "time_until_decay"=>-1} }
    let(:league_entry) { RiotApi::Model::LeagueEntry.new data }

    it "should create a valid object" do
      league_entry.player_or_team_name.should == 'Chaox'
    end
  end
end