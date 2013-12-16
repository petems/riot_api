module RiotApi
  module Resource
    class Summoner < Base

      def name(name, opts = {})
        RiotApi::Model::Summoner.new get("#{base_path}/by-name/#{name}/")
      end

      def id(id, opts = {})
        RiotApi::Model::Summoner.new get("#{base_path}/#{id}/")
      end

      def masteries(id)
        get("#{base_path}/#{id}/masteries")
      end

      def names(*ids)
        ids = ids.compact.join(',')
        get("#{base_path}/#{ids}/name").summoners.map do |summoner|
          RiotApi::Model::Summoner.new summoner
        end
      end

      def runes(id)
        get("#{base_path}/#{id}/runes")
      end

      private

      def base_path
        "summoner"
      end

    end
  end
end
