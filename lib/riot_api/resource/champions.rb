module RiotApi
  module Resource
    class Champions < Base

      def list(free=false)
        get(base_path, { :freeToPlay => free }).champions.map do |champion|
          RiotApi::Model::Champion.new(champion)
        end
      end

      def free
        list(true)
      end

      private

      def base_path
        "champion"
      end
    end
  end
end
