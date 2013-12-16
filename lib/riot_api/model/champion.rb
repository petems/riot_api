module RiotApi
  module Model
    class Champion < Base
      attribute :id, Integer
      attribute :name, String
      attribute :active, Boolean
      attribute :attack_rank, Integer
      attribute :bot_enabled, Boolean
      attribute :bot_mm_enabled, Boolean
      attribute :defense_rank, Integer
      attribute :difficulty_rank, Integer
      attribute :free_to_play, Boolean
      attribute :magic_rank, Integer
      attribute :ranked_play_enabled, Boolean
    end
  end
end
