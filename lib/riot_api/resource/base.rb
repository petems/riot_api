module RiotApi
  module Resource
    class Base
      def initialize(connection, region, options = {})
        @connection = connection
        @region = region
      end

      def get(path, options={})
        @connection.get(full_path(path), options).body
      end

      private

      def full_path(path)
        "#{endpoint_precursor}/#{path}"
      end

      def endpoint_precursor
        "lol/#{@region}/v1.1"
      end
    end
  end
end
