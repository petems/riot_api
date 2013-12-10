module RiotApi
  module Resource
    class Base
      def initialize(connection, options = {})
        @connection = connection
      end
    end
  end
end
