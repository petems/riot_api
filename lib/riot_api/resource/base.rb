module RiotApi
  module Resource
    class Base
      def initialize(connection, options = {})
        @connection = connection
      end

      def endpoint_version
        "v1.1"
      end
    end
  end
end
