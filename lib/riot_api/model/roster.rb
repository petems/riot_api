require 'riot_api/model/member'

module RiotApi
  module Model
    class Roster < Base
      attribute :member_list, Array[RiotApi::Model::Member]
      attribute :owner_id, Integer
    end
  end
end
