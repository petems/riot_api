$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coveralls'
Coveralls.wear!

require 'rspec/autorun'
require 'riot_api'

if ENV['RECORDING']
  API_KEY   = ENV['RIOT_API_KEY']
else
  API_KEY   = 'api_key_YYYYYYYYYYYYYYYYYYYYY'
end

RSpec.configure do |c|
  # VCR:
  # so we can use :vcr rather than :vcr => true;
  # in RSpec 3 this will no longer be necessary.
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

