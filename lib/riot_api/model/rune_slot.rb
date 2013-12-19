require 'riot_api/model/rune'

module RiotApi
  module Model
    class RuneSlot < Base
      attribute :rune, RiotApi::Model::Rune
      attribute :rune_slot_id, Integer
    end
  end
end
