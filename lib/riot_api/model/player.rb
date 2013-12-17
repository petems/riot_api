module RiotApi
  module Model
    class Player < Base
      attribute :summoner_id, Integer
      attribute :team_id,     Integer
      attribute :champion_id, Integer
    end
  end
end
