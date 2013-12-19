require 'spec_helper'

describe RiotApi::Model::TeamStatDetail do

  describe '#initialize' do
    let(:team_id_data) { { full_id: "TEAM-e4936d7b-b80e-4367-a76c-5ccf7388c995" } }
    let(:data) { { average_games_played: 0, losses: 1, team_id: team_id_data, team_stat_type: "RANKED_TEAM_5x5", wins: 30 } }
    let(:team_stat_detail) { RiotApi::Model::TeamStatDetail.new data }

    it "should create a valid object" do
      team_stat_detail.losses.should == data[:losses]
      team_stat_detail.team_id.class.should == RiotApi::Model::TeamId
    end

    it "should create team_id correctly" do
      team_stat_detail.team_id.full_id.should == team_id_data[:full_id]
    end

  end
end
