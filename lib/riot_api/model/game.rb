require 'riot_api/model/player'

module RiotApi
  module Model
    class Game < Base
      attribute :champion_id, Integer
      attribute :create_date, String
      attribute :create_date_str, String
      attribute :fellow_players, Array[RiotApi::Model::Player]
      attribute :game_id, Integer
      attribute :game_mode, String
      attribute :level, Integer
      attribute :map_id, Integer
      attribute :spell1, Integer
      attribute :spell2, Integer
      attribute :statistics, Array[Hash]
      attribute :sub_type, String
      attribute :team_id, Integer
    end
  end
end
