module RiotApi
  module Resource
    class Stats < Base

      def ranked(id, opts = {})
        get("#{base_path(id)}/ranked", opts)
      end

      def summary(id, opts = {})
        get("#{base_path(id)}/summary", opts)
      end

      private

      def base_path(id)
        "stats/by-summoner/#{id}"
      end
    end
  end
end
