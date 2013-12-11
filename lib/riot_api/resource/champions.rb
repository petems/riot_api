module RiotApi
  module Resource
    class Champions < Base

      def list(free=false)
        @connection.get(path, { :freeToPlay => free }).body.champions
      end

      def free
        list(true)
      end

      private

      def path
        "champion"
      end
    end
  end
end
