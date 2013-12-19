module RiotApi
  module Resource
    class Stats < Base

      def ranked(id, opts = {})
        get("#{base_path(id)}/ranked", opts).champions.map do |champion|
          build_champion_stat(champion)
        end
      end

      def summary(id, opts = {})
        get("#{base_path(id)}/summary", opts).player_stat_summaries.map do |summaries|
          build_player_stat_summary(summaries)
        end
      end

      private

      def build_champion_stat(data)
        RiotApi::Model::ChampionStat.new data
      end

      def build_player_stat_summary(data)
        RiotApi::Model::PlayerStatSummary.new data
      end

      def base_path(id)
        "stats/by-summoner/#{id}"
      end
    end
  end
end
