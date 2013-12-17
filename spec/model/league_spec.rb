require 'spec_helper'

describe RiotApi::Model::League do

  describe '#initialize' do
    let(:data) { {"timestamp"=>1387214440647, "name"=>"Wukong's Lancers", "tier"=>"CHALLENGER", "queue"=>"RANKED_SOLO_5x5", "entries"=>[{"player_or_team_id"=>"7460", "player_or_team_name"=>"Chaox", "league_name"=>"Wukong's Lancers", "queue_type"=>"RANKED_SOLO_5x5", "tier"=>"CHALLENGER", "rank"=>"I", "league_points"=>204, "wins"=>919, "losses"=>866, "is_hot_streak"=>false, "is_veteran"=>false, "is_fresh_blood"=>false, "is_inactive"=>false, "last_played"=>0, "time_until_decay"=>-1}, {"player_or_team_id"=>"38839329", "player_or_team_name"=>"Xia0MeLotusMindy", "league_name"=>"Wukong's Lancers", "queue_type"=>"RANKED_SOLO_5x5", "tier"=>"CHALLENGER", "rank"=>"I", "league_points"=>629, "wins"=>504, "losses"=>393, "is_hot_streak"=>false, "is_veteran"=>true, "is_fresh_blood"=>false, "is_inactive"=>false, "last_played"=>0, "time_until_decay"=>-1}]} }
    let(:league) { RiotApi::Model::League.new data }
    let(:league_entry) { league.entries.first }

    it "should create a valid object" do
      league.name.should == data['name']
      league.entries.count.should == 2
      league_entry.class.should == RiotApi::Model::LeagueEntry
      league_entry.player_or_team_name.should == 'Chaox'
    end
  end
end