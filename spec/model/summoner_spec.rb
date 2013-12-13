require 'spec_helper'

describe RiotApi::Model::Summoner do

  describe '#initialize' do
    let(:data) { { id: 44600324, name: "Best Lux EUW", profile_icon_id: 7, summoner_level: 6, revision_date: 1375116256000, revision_date_str: "07/29/2013 04:44 PM UTC" } }
    let(:summoner) { RiotApi::Model::Summoner.new data }

    it "should create a valid object" do
      summoner.id.should == data[:id]
      summoner.revision_date.should == data[:revision_date]
    end
  end
end