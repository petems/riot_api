module RiotApi
  module Model
    class Statistic < Base
      attribute :c,     Integer
      attribute :id,    Integer
      attribute :name,  String
      attribute :value, Integer

      alias :count :c
    end
  end
end
