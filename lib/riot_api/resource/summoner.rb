module RiotApi
  module Resource
    class Summoner < Base

      def name(name, opts = {})
        RiotApi::Model::Summoner.new @connection.get("#{base_path}/by-name/#{name}/").body
      end

      def id(id, opts = {})
        RiotApi::Model::Summoner.new @connection.get("#{base_path}/#{id}/").body
      end

      private

      def base_path
        "#{endpoint_precursor}/summoner/"
      end

    end
  end
end
