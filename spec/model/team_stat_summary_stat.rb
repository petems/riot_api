require 'spec_helper'

describe RiotApi::Model::TeamStatSummary do

  describe '#initialize' do
    let(:team_id_data) { { full_id: "TEAM-e4936d7b-b80e-4367-a76c-5ccf7388c995" } }
    let(:team_stat_details_data) { { average_games_played: 0, losses: 1, team_id: team_id_data, team_stat_type: "RANKED_TEAM_5x5", wins: 30 } }
    let(:data) { { team_id: team_id_data, team_stat_details: [ team_stat_details_data ] } }
    let(:team_stat_summary) { RiotApi::Model::TeamStatSummary.new data }

    it "should create a valid object" do
      team_stat_summary.team_id.class.should == RiotApi::Model::TeamId
    end

    it "should create team_id correctly" do
      team_stat_summary.team_id.class.should == RiotApi::Model::TeamId
      team_stat_summary.team_id.full_id.should == team_id_data[:full_id]
    end

    it "should create team_stat_details correctly" do
      team_stat_summary.team_stat_details.class.should == Array
      team_stat_summary.team_stat_details.first.class.should == RiotApi::Model::TeamStatDetail
      team_stat_summary.team_stat_details.first.team_id.class.should == RiotApi::Model::TeamId
      team_stat_summary.team_stat_details.first.losses.should == 1
    end
  end
end
