module RiotApi
  module Resource
    class Team < BaseV21

      def by_summoner(summoner_id)
        get(by_summoner_path(summoner_id))
      end

      private

      def by_summoner_path(summoner_id)
        "#{base_path}/by-summoner/#{summoner_id}"
      end

      def base_path
        "team"
      end

    end
  end
end
