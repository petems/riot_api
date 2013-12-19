require 'spec_helper'

describe RiotApi::Model::Member do

  describe '#initialize' do
    let(:data) { { invite_date: 1321959007000, join_date: 1321959007000, player_id: 17772, status: "MEMBER" } }
    let(:member) { RiotApi::Model::Member.new data }

    it "should create a valid object" do
      member.player_id.should == data[:player_id]
    end
  end
end
