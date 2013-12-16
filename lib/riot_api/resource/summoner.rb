module RiotApi
  module Resource
    class Summoner < Base

      def name(name, opts = {})
        build_summoner get("#{base_path}/by-name/#{name}")
      end

      def id(id, opts = {})
        build_summoner get("#{base_path}/#{id}")
      end

      def masteries(id)
        get("#{base_path}/#{id}/masteries")
      end

      def names(*ids)
        ids = ids.compact.join(',')
        get("#{base_path}/#{ids}/name").summoners.map do |summoner|
          build_summoner summoner
        end
      end

      def runes(id)
        get("#{base_path}/#{id}/runes")
      end

      private

      def build_summoner(data)
        RiotApi::Model::Summoner.new data
      end

      def base_path
        "summoner"
      end

    end
  end
end
