require File.expand_path('../middleware/custom_logger', __FILE__)

module RiotApi
  class API

    # Creates a new Riot API client instance.
    #
    # @param [Hash] params
    # @option params [String] :api_key The api_key (required)
    # @option params [String] :api_key The region ('eune','br','tr','na','euw') (required)
    # @option params [String] :base_url ("http://prod.api.pvp.net/api/lol/#{@region}/") API base url with region
    # @option params [Symbol] :faraday_adapter ('Faraday.default_adapter')  Faraday adapter/http client library to use.
    # @raise [ArgumentError] when no api_key is provided
    # @raise [ArgumentError] when no region is provided
    # @raise [ArgumentError] when region is not one of 'eune','br','tr','na', or 'euw'
    # @example
    #   ra = RiotApi::API.new :api_key => '######', :region => 'euw'
    #
    # @see [Faraday]
    def initialize(params)
      @api_key             = params[:api_key]
      @region              = params[:region]
      @debug               = params[:debug]
      @ssl                 = params[:ssl] || { :verify => true }
      @base_url            = params[:base_url]            || "http://prod.api.pvp.net/api/"
      @faraday_adapter     = params[:faraday_adapter]     || Faraday.default_adapter
      @raise_status_errors = params[:raise_status_errors] || false
      @faraday             = params[:faraday]             || default_faraday
      raise ArgumentError, ':api_key missing' unless @api_key
      raise ArgumentError, ':region missing' unless @region
      raise ArgumentError, "Invalid Region (Valid regions: 'eune','br','tr','na','euw')" unless ['eune','br','tr','na','euw'].include?(@region)
    end

    def champions
      RiotApi::Resource::Champions.new(@faraday, @region)
    end

    def game
      RiotApi::Resource::Game.new(@faraday, @region)
    end

    def league
      RiotApi::Resource::League.new(@faraday, @region)
    end

    def stats
      RiotApi::Resource::Stats.new(@faraday, @region)
    end

    def summoner
      RiotApi::Resource::Summoner.new(@faraday, @region)
    end

    def team
      RiotApi::Resource::Team.new(@faraday, @region)
    end

    def default_faraday
      Faraday.new(:url => @base_url, :ssl => @ssl) do |faraday|
        faraday.use Faraday::Response::RaiseError if @raise_status_errors
        faraday.use CustomLogger if @debug
        faraday.request  :url_encoded
        faraday.response :rashify
        faraday.response :json
        faraday.adapter @faraday_adapter
        faraday.params['api_key'] = @api_key
        faraday.headers['User-Agent'] = "riot_api rubygem v#{RiotApi::VERSION}"
      end
    end

  end
end
