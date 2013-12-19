require 'spec_helper'

describe RiotApi::Model::Match do

  describe '#initialize' do
    let(:data) { { assists: 24, date: 1383711181657, deaths: 12, game_id: 1147232295, game_mode: "CLASSIC", invalid: false, kills: 22, map_id: 1, opposing_team_kills: 12, opposing_team_name: "mcmaster lol", win: true } }
    let(:match) { RiotApi::Model::Match.new data }

    it "should create a valid object" do
      match.assists.should == data[:assists]
    end
  end
end
