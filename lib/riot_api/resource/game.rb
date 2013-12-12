module RiotApi
  module Resource
    class Game < Base

      def recent(summoner_id)
        @connection.get(recent_path(summoner_id)).body.games
      end

      private

      def recent_path(summoner_id)
        "#{base_path(summoner_id)}/recent"
      end

      def base_path(summoner_id)
        "#{endpoint_precursor}/game/by-summoner/#{summoner_id}"
      end

    end
  end
end
