module RiotApi
  module Resource
    class Summoner < Base

      def name(name, opts = {})
        build_summoner get("#{base_path}/by-name/#{name}")
      end

      def id(id, opts = {})
        build_summoner get("#{base_path}/#{id}")
      end

      def masteries(id)
        get("#{base_path}/#{id}/masteries").pages.map do |page|
          build_mastery_page page
        end
      end

      def names(*ids)
        ids = ids.compact.join(',')
        get("#{base_path}/#{ids}/name").summoners.map do |summoner|
          build_summoner summoner
        end
      end

      def runes(id)
        get("#{base_path}/#{id}/runes").pages.map do |page|
          build_rune_page page
        end
      end

      private

      def build_mastery_page(data)
        RiotApi::Model::MasteryPage.new data
      end

      def build_rune_page(data)
        RiotApi::Model::RunePage.new data
      end

      def build_summoner(data)
        RiotApi::Model::Summoner.new data
      end

      def base_path
        "summoner"
      end

    end
  end
end
