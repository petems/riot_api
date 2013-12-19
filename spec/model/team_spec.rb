require 'spec_helper'

describe RiotApi::Model::Team do

  describe '#initialize' do
    let(:match_history_data) { { assists: 24, date: 1383711181657, deaths: 12, game_id: 1147232295, game_mode: "CLASSIC", invalid: false, kills: 22, map_id: 1, opposing_team_kills: 12, opposing_team_name: "mcmaster lol", win: true } }
    let(:member_list_data) { { invite_date: 1321959007000, join_date: 1321959007000, player_id: 17772, status: "MEMBER" } }
    let(:roster_data) { { member_list: [ member_list_data ], owner_id: 19199530 } }
    let(:team_id_data) { { full_id: "TEAM-e4936d7b-b80e-4367-a76c-5ccf7388c995" } }
    let(:team_stat_details_data) { { average_games_played: 0, losses: 1, team_id: team_id_data, team_stat_type: "RANKED_TEAM_5x5", wins: 30 } }
    let(:team_stat_summary_data) { { team_id: team_id_data, team_stat_details: [ team_stat_details_data ] } }
    let(:data) { { create_date: 1321959007000, last_game_date: 1383711181000, last_join_date: 1383700685000, last_joined_ranked_team_queue_date: 1383708165000, match_history: [ match_history_data ], modify_date: 1383711181000, name: "Team Solo Mid", roster: roster_data, second_last_join_date: 1380166227000, status: "RANKED", tag: "TSM", team_id: team_id_data, team_stat_summary: team_stat_summary_data, third_last_join_date: 1372822629000, timestamp: 1387464944264 } }
    let(:team) { RiotApi::Model::Team.new data }

    it "should create a valid object" do
      team.create_date.should == data[:create_date]
    end

    it "should create match_history correctly" do
      team.match_history.class.should == Array
      team.match_history.first.class.should == RiotApi::Model::Match
      team.match_history.first.assists.should == match_history_data[:assists]
    end

    it "should create roster correctly" do
      team.roster.class.should == RiotApi::Model::Roster
      team.roster.owner_id.should == roster_data[:owner_id]
      team.roster.member_list.class.should == Array
      team.roster.member_list.first.class.should == RiotApi::Model::Member
    end

    it "should create team_id correctly" do
      team.team_id.class.should == RiotApi::Model::TeamId
      team.team_id.full_id.should == team_id_data[:full_id]
    end

    it "should create team_stat_summary correctly" do
      team.team_stat_summary.class.should == RiotApi::Model::TeamStatSummary
      team.team_stat_summary.team_id.class.should == RiotApi::Model::TeamId
      team.team_stat_summary.team_stat_details.class.should == Array
      team.team_stat_summary.team_stat_details.first.class.should == RiotApi::Model::TeamStatDetail
    end
  end
end
