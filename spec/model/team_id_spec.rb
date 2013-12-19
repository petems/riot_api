require 'spec_helper'

describe RiotApi::Model::TeamId do

  describe '#initialize' do
    let(:data) { { full_id: "TEAM-e4936d7b-b80e-4367-a76c-5ccf7388c995" } }
    let(:team_id) { RiotApi::Model::TeamId.new data }

    it "should create a valid object" do
      team_id.full_id.should == data[:full_id]
    end
  end
end
