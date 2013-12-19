require 'spec_helper'

describe RiotApi::Model::MasteryPage do

  describe '#initialize' do
    let(:data) { { :current => false, :name => "Standard", :talents => [RiotApi::Model::Talent.new] } }
    let(:rune_page) { RiotApi::Model::MasteryPage.new data }

    it "should create a valid object" do
      rune_page.name.should == data[:name]
      rune_page.talents.should_not be_empty
      rune_page.talents.first.class.should == RiotApi::Model::Talent
    end
  end
end

