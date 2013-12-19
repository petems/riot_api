require 'spec_helper'

describe RiotApi::Model::Roster do

  describe '#initialize' do
    let(:data) { { member_list: [ { invite_date: 1321959007000, join_date: 1321959007000, player_id: 17772, status: "MEMBER" } ], owner_id: 19199530 } }
    let(:roster) { RiotApi::Model::Roster.new data }

    it "should create a valid object" do
      roster.owner_id.should == data[:owner_id]
      roster.member_list.class.should == Array
      roster.member_list.first.class.should == RiotApi::Model::Member
    end
  end
end
