require 'spec_helper'

describe RiotApi::Model::ChampionStat do

  describe '#initialize' do
    let(:data) { { :id => 111, :name => "Nautilus", :stats => [ { :c => 1, :id => 13, :name => "TOTAL_PENTA_KILLS", :value => 0 }, { :c => 1, :id => 14, :name => "TOTAL_DEATHS_PER_SESSION", :value => 5 } ] } }
    let(:champion_stat) { RiotApi::Model::ChampionStat.new data }

    it "should create a valid object" do
      champion_stat.id.should == data[:id]
      champion_stat.name.should == data[:name]
      champion_stat.stats.class.should == Array
      champion_stat.stats.first.class.should == RiotApi::Model::Statistic

      champion_stat.statistics.should == champion_stat.stats
    end
  end
end
