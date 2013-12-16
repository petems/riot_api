require 'riot_api/model/league_entry'

module RiotApi
  module Model
    class League < Base
      attribute :timestamp, Integer
      attribute :name, String
      attribute :tier, String
      attribute :queue, String
      attribute :entries, Array[RiotApi::Model::LeagueEntry]
    end
  end
end