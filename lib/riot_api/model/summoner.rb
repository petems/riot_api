module RiotApi
  module Model
    class Summoner < Base
      attribute :id,        Integer
      attribute :name,      String
      attribute :profile_icon_id, Integer
      attribute :summoner_level,  Integer
      attribute :revision_date_str, String
    end
  end
end
