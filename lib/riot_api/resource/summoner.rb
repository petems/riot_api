module RiotApi
  module Resource
    class Summoner < Base

      def name(name, opts = {})
        @connection.get("summoner/by-name/#{name}/").body
      end

      def id(id, opts = {})
        @connection.get("summoner/#{id}/").body
      end

    end
  end
end
