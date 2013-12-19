module RiotApi
  module Resource
    class Team < BaseV21

      def by_summoner(summoner_id)
        get(by_summoner_path(summoner_id)).map do |team|
          build_team(team)
        end
      end

      private

      def build_team(data)
        RiotApi::Model::Team.new data
      end

      def by_summoner_path(summoner_id)
        "#{base_path}/by-summoner/#{summoner_id}"
      end

      def base_path
        "team"
      end

    end
  end
end
