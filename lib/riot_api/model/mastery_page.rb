require 'riot_api/model/talent'

module RiotApi
  module Model
    class MasteryPage < Base
      attribute :current, Boolean
      attribute :name, String
      attribute :talents, Array[RiotApi::Model::Talent]
    end
  end
end
