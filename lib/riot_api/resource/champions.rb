module RiotApi
  module Resource
    class Champions < Base

      def list(free=false)
        @connection.get(base_path, { :freeToPlay => free }).body.champions.map do |champion|
          RiotApi::Model::Champion.new(champion)
        end
      end

      def free
        list(true)
      end

      private

      def base_path
        "#{endpoint_precursor}/champion"
      end
    end
  end
end
