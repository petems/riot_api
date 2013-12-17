require 'riot_api/model/rune_slot'

module RiotApi
  module Model
    class RunePage < Base
      attribute :current, Boolean
      attribute :id, Integer
      attribute :name, String
      attribute :slots, Array[RiotApi::Model::RuneSlot]
    end
  end
end
