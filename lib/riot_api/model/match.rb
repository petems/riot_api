module RiotApi
  module Model
    class Match < Base
      attribute :assists, Integer
      attribute :date, Integer
      attribute :deaths, Integer
      attribute :game_id, Integer
      attribute :game_mode, String
      attribute :invalid, Boolean
      attribute :kills, Integer
      attribute :map_id, Integer
      attribute :opposing_team_kills, Integer
      attribute :opposing_team_name, String
      attribute :win, Boolean
    end
  end
end
