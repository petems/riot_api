module RiotApi
  module Resource
    class Stats < Base

      def ranked(id, opts = {})
        @connection.get("#{base_path(id)}/ranked").body
      end

      def summary(id, opts = {})
        @connection.get("#{base_path(id)}/summary").body
      end

      private

      def base_path(id)
        "#{endpoint_version}/stats/by-summoner/#{id}"
      end
    end
  end
end
