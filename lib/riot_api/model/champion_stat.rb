require 'riot_api/model/statistic'

module RiotApi
  module Model
    class ChampionStat < Base
      attribute :id, Integer
      attribute :name, String
      attribute :stats, Array[RiotApi::Model::Statistic]

      alias :statistics :stats
    end
  end
end
