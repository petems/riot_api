module RiotApi
  class API
    def initialize(params)
      @api_key             = params[:api_key]
      @region              = params[:region]
      @debug               = params[:debug]
      @ssl                 = params[:ssl] || { :verify => true }
      @base_url            = params[:base_url]            || "http://prod.api.pvp.net/api/lol/#{@region}/v1.1/"
      @faraday_adapter     = params[:faraday_adapter]     || Faraday.default_adapter
      @raise_status_errors = params[:raise_status_errors] || false
      @faraday             = params[:faraday]             || default_faraday
      raise ArgumentError, ':api_key missing' unless @api_key
      raise ArgumentError, ':region missing' unless @region
    end

    def summoner
      RiotApi::Resource::Summoner.new(@faraday)
    end

    def stats
      RiotApi::Resource::Stats.new(@faraday)
    end

    def default_faraday
      Faraday.new(:url => @base_url, :ssl => @ssl) do |faraday|
        faraday.use Faraday::Response::RaiseError if @raise_status_errors
        faraday.request  :url_encoded
        faraday.response :rashify
        faraday.response :json
        faraday.response(:logger) if @debug
        faraday.adapter @faraday_adapter
        faraday.params['api_key'] = @api_key
        faraday.headers['User-Agent'] = "riot_api rubygem v#{RiotApi::VERSION}"
      end
    end
  end
end
