module RiotApi
  module Resource
    class League < BaseV21

      def by_summoner(summoner_id)
        get(by_summoner_path(summoner_id))[summoner_id.to_s]
      end

      private

      def build_league(data)
        Riot::Model::League.new data
      end

      def by_summoner_path(summoner_id)
        "#{base_path}/by-summoner/#{summoner_id}"
      end

      def base_path
        "league"
      end

    end
  end
end
