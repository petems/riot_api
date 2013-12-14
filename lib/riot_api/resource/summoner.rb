module RiotApi
  module Resource
    class Summoner < Base

      def name(name, opts = {})
        RiotApi::Model::Summoner.new @connection.get("#{base_path}/by-name/#{name}/").body
      end

      def id(id, opts = {})
        RiotApi::Model::Summoner.new @connection.get("#{base_path}/#{id}/").body
      end

      def masteries(id)
        @connection.get("#{base_path}/#{id}/masteries").body
      end

      def names(*ids)
        ids = ids.compact.join(',')
        @connection.get("#{base_path}/#{ids}/name").body.summoners.map do |summoner|
          RiotApi::Model::Summoner.new summoner
        end
      end

      private

      def base_path
        "#{endpoint_precursor}/summoner/"
      end

    end
  end
end
