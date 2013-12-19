require 'spec_helper'

describe RiotApi::Model::PlayerStatSummary do

  describe '#initialize' do
    let(:data) { { aggregated_stats: [ { count: 0, id: 23, name: "TOTAL_TURRETS_KILLED" }, { count: 150, id: 53, name: "TOTAL_DECAYER" } ], losses: 0, modify_date: 1385124845000, modify_date_str: 1385124845000, player_stat_summary_type: "AramUnranked5x5", wins: 1 } }
    let(:player_stat_summary) { RiotApi::Model::PlayerStatSummary.new data }

    it "should create a valid object" do
      player_stat_summary.aggregated_stats.class.should == Array
      player_stat_summary.aggregated_stats.first.class.should == RiotApi::Model::Statistic

      player_stat_summary.losses.should == data[:losses]
      player_stat_summary.modify_date.should == data[:modify_date]
      player_stat_summary.modify_date_str.should == data[:modify_date_str].to_s
      player_stat_summary.player_stat_summary_type.should == data[:player_stat_summary_type]
      player_stat_summary.wins.should == data[:wins]
    end
  end
end
