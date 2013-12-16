require 'spec_helper'

describe RiotApi::API, :vcr do
  subject { ra = RiotApi::API.new :api_key => api_key, :region => 'euw' }
  let(:api_key)   { API_KEY }

  describe '.new' do
    it 'should return an instance when called with the essential parameters' do
      client = RiotApi::API.new :api_key => api_key, :region => 'euw'
      client.should be_instance_of(RiotApi::API)
    end

    it 'should raise an error when no api key given' do
      expect{ client = RiotApi::API.new :region => 'euw'}.to raise_error(ArgumentError, ':api_key missing')
    end

    it 'should raise an error when given an invalid region' do
      expect{ client = RiotApi::API.new :api_key => api_key, :region => 'YYZ'}.to raise_error(ArgumentError, "Invalid Region (Valid regions: 'eune','br','tr','na','euw')")
    end

    it 'should output to stdout with debug parameter' do
      client = RiotApi::API.new :api_key => api_key, :region => 'euw', :debug => true

      printed = capture_stdout do
        client.summoner.name 'BestLuxEUW'
      end
      expect(printed).to include 'Started GET request to: http://prod.api.pvp.net/api/lol/euw/v1.1/summoner/by-name/BestLuxEUW?api_key=[API-KEY]'
    end
  end

  describe 'ssl settings' do
    it 'should by default enforce ssl' do
      subject.default_faraday.ssl.should == { :verify => true }
    end
  end

  describe '#summoner' do
    let(:summoner_name) { 'BestLuxEUW' }
    let(:summoner_id) { '44600324' }

    describe '#name' do
      let(:response) {
        subject.summoner.name summoner_name
      }

      it 'should return information from the summoner name' do
        response.id.should eql(44600324)
        response.name.should eql("Best Lux EUW")
        response.profile_icon_id.should eql(7)
        response.revision_date.should eql(1375116256000)
        response.revision_date_str.should eql('07/29/2013 04:44 PM UTC')
        response.summoner_level.should eql(6)
      end
    end

    describe '#id' do
      let(:response) {
        subject.summoner.id summoner_id
      }

      it 'should return information from the summoner id' do
        response.id.should eql(44600324)
        response.name.should eql("Best Lux EUW")
        response.profile_icon_id.should eql(7)
        response.revision_date.should eql(1375116256000)
        response.revision_date_str.should eql('07/29/2013 04:44 PM UTC')
        response.summoner_level.should eql(6)
      end
    end

    describe '#masteries' do
      let(:summoner_id) { '19531813' }

      let(:response) {
        subject.summoner.masteries summoner_id
      }

      it 'should return a list of mastery pages containing lists of talents' do
        response.pages.count.should be > 0
        response.pages.first.talents.count.should be > 0
      end
    end

    describe '#names' do
      let(:froggen) { '19531813' }
      let(:response) {
        subject.summoner.names summoner_id, froggen
      }

      it "should return an array of summoners with name set" do
        response.class.should == Array
        response.count.should == 2
        response.first.class.should == RiotApi::Model::Summoner
        response.first.name.should == "Best Lux EUW"
      end
    end

    describe '#runes' do
      let(:summoner_id) { '19531813' }

      let(:response) {
        subject.summoner.runes summoner_id
      }

      it 'should return a list of rune pages containing lists of talents' do
        response.pages.count.should be > 0
        response.pages.first.slots.count.should be > 0
      end
    end

  end

  describe '#stats' do
    let(:summoner_id) { '19531813' }

    # Ranked command requires user has played ranked
    describe '#ranked' do

      describe 'omitting season' do
        let(:response) {
          subject.stats.ranked summoner_id
        }

        it 'should return ranked information from the summoner id' do
          response.summonerId.should eql(19531813)
          response.champions.first.first.should eql ["id", 111]
        end
      end

      describe 'specifying season' do
        let(:response) {
          subject.stats.ranked summoner_id, :season => "SEASON3"
        }

        it 'should return ranked information from the summoner id for the specified season' do
          response.summonerId.should eql(19531813)
          response.champions.first.first.should eql ["id", 111]
        end
      end
    end

    describe '#summary' do

      describe 'omitting season' do
        let(:response) {
          subject.stats.summary summoner_id
        }

        it 'should return summary information from the summoner id' do
          response.summonerId.should eql(19531813)
          response.playerStatSummaries.first.should include 'aggregated_stats'
        end
      end

      describe 'specifying season' do
        let(:response) {
          subject.stats.summary summoner_id, :season => "SEASON3"
        }

        it 'should return summary information from the summoner id for the specified season' do
          response.summonerId.should eql(19531813)
          response.playerStatSummaries.first.should include 'aggregated_stats'
        end
      end
    end

  end

  describe '#champions' do
    let(:current_champion_count) { 116 }

    describe '#list' do
      let(:champions) {
        subject.champions.list
      }

      it 'should return a list of all champions' do
        champions.count.should be >= current_champion_count
        champions.first.respond_to?(:name).should be_true
      end
    end

    describe '#free' do
      let(:champions) {
        subject.champions.free
      }

      it 'should return a list of all free champions' do
        champions.should_not be_empty
        champions.count.should be < current_champion_count
        champions.first.respond_to?(:name).should be_true
        champions.first.free_to_play.should be_true
      end
    end

  end

  describe '#game' do
    let(:summoner_id) { '19531813' }

    # Ranked command requires user has played ranked
    describe '#recent' do
      let(:games) { subject.game.recent summoner_id }
      let(:game)  { games.first }

      it 'should return a list of recent games played' do
        game.class.should == RiotApi::Model::Game
        game.champion_id.should_not be_nil
      end
    end
  end

  describe '#league', :vcr do
    let(:summoner_id) { '19531813' }

    describe '#by_summoner' do
      let(:response) {
        subject.league.by_summoner summoner_id
      }

      it 'should return leagues data for summoner' do
        response["entries"].count.should > 0
        response.tier.should == 'CHALLENGER'
      end
    end
  end


  describe '#team', :vcr do
    let(:summoner_id) { '19531813' }

    describe '#by_summoner' do
      let(:response) {
        subject.team.by_summoner summoner_id
      }

      it 'should return team data for summoner' do
        response.count.should > 0
        response.first.first.should == ["timestamp", 1387051307170]
      end
    end
  end

end
