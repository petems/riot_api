module RiotApi
  module Model
    class Member < Base
      attribute :invite_date, Integer
      attribute :join_date, Integer
      attribute :player_id, Integer
      attribute :status, String
    end
  end
end
