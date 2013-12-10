# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'riot_api/version'

Gem::Specification.new do |gem|
  gem.name          = 'riot_api'
  gem.version       = RiotApi::VERSION
  gem.authors       = ['Peter Souter']
  gem.email         = ['p.morsou@gmail.com']
  gem.description   = %q{A Ruby gem for the Riot Games API}
  gem.summary       = %q{This gem wraps the Riot Games API documented at https://developer.riotgames.com/api/}
  gem.homepage      = 'https://github.com/petems/riot_api'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  if RUBY_PLATFORM == 'java'
    gem.add_runtime_dependency 'jruby-openssl'
  end

  gem.add_dependency 'faraday', '~> 0.8.7'
  gem.add_dependency 'faraday_middleware', '~> 0.9.0'
  gem.add_dependency 'json', '~> 1.8.1'
  gem.add_dependency 'rash', '~> 0.4.0'

  gem.add_development_dependency 'rspec', '~> 2.0'
  gem.add_development_dependency 'guard', '~> 2.1.0'
  gem.add_development_dependency 'guard-rspec', '~> 4.0.1'

  if RUBY_PLATFORM =~ /darwin/i
    gem.add_development_dependency 'rb-fsevent', '~> 0.9.3'
  end

  gem.add_development_dependency 'vcr',     '~> 2.4'
  gem.add_development_dependency 'fakeweb', '~> 1.3.0'
  gem.add_development_dependency 'rake',  '~> 10.1.0'
  gem.add_development_dependency 'coveralls', '~> 0.7.0'
end
