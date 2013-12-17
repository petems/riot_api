module RiotApi
  module Model
    class LeagueEntry < Base
      attribute :is_fresh_blood, Boolean
      attribute :is_hot_streak, Boolean
      attribute :is_inactive, Boolean
      attribute :is_veteran, Boolean
      attribute :last_played, Integer
      attribute :league_name, String
      attribute :league_points, Integer
      attribute :losses, Integer
      attribute :player_or_team_id, String
      attribute :player_or_team_name, String
      attribute :queue_type, String
      attribute :rank, String
      attribute :tier, String
      attribute :time_until_decay, Integer
      attribute :wins, Integer
    end
  end
end
