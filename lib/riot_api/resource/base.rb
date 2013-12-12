module RiotApi
  module Resource
    class Base
      def initialize(connection, region, options = {})
        @connection = connection
        @region = region
      end

      def endpoint_precursor
        "lol/#{@region}/v1.1"
      end
    end
  end
end
