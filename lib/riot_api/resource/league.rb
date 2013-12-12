module RiotApi
  module Resource
    class League < BaseV21

      def by_summoner(summoner_id)
        @connection.get(by_summoner_path(summoner_id)).body[summoner_id.to_s]
      end

      private

      def by_summoner_path(summoner_id)
        "#{base_path}/by-summoner/#{summoner_id}"
      end

      def base_path
        "#{endpoint_precursor}/league"
      end

    end
  end
end
