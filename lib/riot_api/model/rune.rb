module RiotApi
  module Model
    class Rune < Base
      attribute :id, Integer
      attribute :name, String
      attribute :description, String
      attribute :tier, Integer
    end
  end
end