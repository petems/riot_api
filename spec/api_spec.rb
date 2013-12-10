require 'spec_helper'

describe RiotApi::API, :vcr do
  subject { ra = RiotApi::API.new :api_key => api_key, :region => 'euw' }
  let(:api_key)   { API_KEY }

  describe '.new' do
    it 'should return an instance when called with the essential parameters' do
      client = RiotApi::API.new :api_key => api_key, :region => 'euw'
      client.should be_instance_of(RiotApi::API)
    end
  end

  describe 'ssl settings' do
    it 'should by default enforce ssl' do
      subject.default_faraday.ssl.should == { :verify => true }
    end
  end

  describe '#summoner' do
    let(:summoner_name) { 'BestLuxEUW' }

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

  end
end
