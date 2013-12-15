module RiotApi
  module Resource
    class Champions < Base

      def list(free=false)
        champions = []
        response = @connection.get(base_path, { :freeToPlay => free }).body
        response.champions.each do |champion|
          champions << RiotApi::Model::Champion.new(champion)
        end
        champions
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
