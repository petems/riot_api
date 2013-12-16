require 'faraday'
require 'faraday_middleware'

require 'riot_api/version'
require 'riot_api/api'
require 'riot_api/resource'
require 'riot_api/model'

require 'riot_api/middleware/response_middleware'
require 'riot_api/middleware/logger'
require 'riot_api/middleware/parse_json'
require 'riot_api/middleware/mashify'
require 'riot_api/middleware/rashify'

module RiotApi
end
