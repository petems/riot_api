module RiotApi
  module Resource
    class Stats < Base

      def ranked(id, opts = {})
        @connection.get("stats/by-summoner/#{id}/ranked").body
      end

      def summary(id, opts = {})
        @connection.get("stats/by-summoner/#{id}/summary").body
      end

    end
  end
end
