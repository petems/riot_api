require 'spec_helper'

describe RiotApi::Model::Game do

  describe '#initialize' do
    let(:data) { {"game_id"=>1188581883, "invalid"=>false, "game_mode"=>"CLASSIC", "game_type"=>"MATCHED_GAME", "sub_type"=>"RANKED_SOLO_5x5", "map_id"=>1, "team_id"=>200, "champion_id"=>412, "spell1"=>14, "spell2"=>4, "level"=>30, "create_date"=>1386619495913, "create_date_str"=>1386619495913, "fellow_players"=>[{"summoner_id"=>20200953, "team_id"=>100, "champion_id"=>92}, {"summoner_id"=>43470519, "team_id"=>200, "champion_id"=>33}], "statistics"=>[{"id"=>1, "name"=>"LEVEL", "value"=>12}, {"id"=>2, "name"=>"GOLD_EARNED", "value"=>8568}]} }
    let(:game) { RiotApi::Model::Game.new data }

    it "should create a valid object" do
      game.game_id.should == data['game_id']
      game.game_mode.should == data['game_mode']
      game.fellow_players.class.should == Array
      game.fellow_players.first.class.should == RiotApi::Model::Player
      game.statistics.class.should == Array
      game.statistics.first.class.should == RiotApi::Model::Statistic
    end
  end
end
