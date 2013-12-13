require 'vcr'
require 'pp'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr/cassettes'
  c.hook_into :faraday
  c.configure_rspec_metadata!

  if ENV['RECORDING']
    c.filter_sensitive_data('api_key_YYYYYYYYYYYYYYYYYYYYY') { ENV['RIOT_API_KEY'] }
  end

  c.filter_sensitive_data('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') do |http_interaction|
    #Not sure if this needs removing, but better safe than sorry...
    if http_interaction.response.headers['x-newrelic-app-data'] != nil
      http_interaction.response.headers['x-newrelic-app-data'].first
    end
  end

end
