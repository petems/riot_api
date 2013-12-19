module RiotApi
  module Model
    class PlayerStatSummary < Base
      attribute :aggregated_stats, Array[RiotApi::Model::Statistic]
      attribute :losses, Integer
      attribute :modify_date, Integer
      attribute :modify_date_str, String
      attribute :player_stat_summary_type, String
      attribute :wins, Integer
    end
  end
end
