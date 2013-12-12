module RiotApi
  module Resource
    class Champions < Base

      def list(free=false)
        @connection.get(base_path, { :freeToPlay => free }).body.champions
      end

      def free
        list(true)
      end

      private

      def base_path
        "#{endpoint_version}/champion"
      end
    end
  end
end
