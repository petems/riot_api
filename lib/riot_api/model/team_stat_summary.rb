require 'riot_api/model/team_id'
require 'riot_api/model/team_stat_detail'

module RiotApi
  module Model
    class TeamStatSummary < Base
      attribute :team_id, RiotApi::Model::TeamId
      attribute :team_stat_details, Array[RiotApi::Model::TeamStatDetail]
    end
  end
end
