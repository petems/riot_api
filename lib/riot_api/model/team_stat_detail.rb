require 'riot_api/model/team_id'

module RiotApi
  module Model
    class TeamStatDetail < Base
      attribute :average_games_played, Integer
      attribute :losses, Integer
      attribute :team_id, RiotApi::Model::TeamId
      attribute :team_stat_type, String
      attribute :wins, Integer
    end
  end
end
