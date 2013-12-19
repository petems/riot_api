require 'riot_api/model/match'
require 'riot_api/model/roster'
require 'riot_api/model/team_id'
require 'riot_api/model/team_stat_summary'

module RiotApi
  module Model
    class Team < Base
      attribute :create_date, Integer
      attribute :last_game_date, Integer
      attribute :last_join_date, Integer
      attribute :last_joined_ranked_team_queue_date, Integer
      attribute :match_history, Array[RiotApi::Model::Match]
      attribute :modify_date, Integer
      attribute :name, String
      attribute :roster, RiotApi::Model::Roster
      attribute :second_last_join_date, Integer
      attribute :status, String
      attribute :tag, String
      attribute :team_id, RiotApi::Model::TeamId
      attribute :team_stat_summary, RiotApi::Model::TeamStatSummary
      attribute :third_last_join_date, Integer
      attribute :timestamp, Integer
    end
  end
end
