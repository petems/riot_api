# Riot API

[![Gem Version](https://badge.fury.io/rb/riot_api.png)](http://badge.fury.io/rb/riot_api)
[![Coverage Status](https://coveralls.io/repos/petems/riot_api/badge.png)](https://coveralls.io/r/petems/riot_api)
[![Build Status](https://travis-ci.org/petems/riot_api.png?branch=master)](https://travis-ci.org/petems/riot_api)
[![Dependency Status](https://gemnasium.com/petems/riot_api.png)](https://gemnasium.com/petems/riot_api)

A Ruby wrapper around connecting to the [Riot API](https://developer.riotgames.com)

Early days yet, but trying to make it as modular as possible :cat:

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'riot_api'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install riot_api
```

## Usage:

First, you'll need to go to [http://developer.riotgames.com/](http://developer.riotgames.com/) and get an API key.

```ruby
require 'riot_api'

# Create Instace of the API
ra = RiotApi::API.new :api_key => 'API_KEY_HERE', :region => 'euw', :debug => true

# Search by Summoner name
summoner_details = ra.summoner.name('Best Lux EUW')
#<Hashie::Rash id=44600324 name="Best Lux EUW" profile_icon_id=7 revision_date=1375116256000 revision_date_str="07/29/2013 04:44 PM UTC" summoner_level=6>

summoner.name # => "Best Lux EUW"
```

## Methods

```
RiotApi::API
  #summoner
    #name(summoner_name)
      should return information from a given summoner name
    #id(summoner_name)
      should return information from a given summoner id
    #names(summoner_name_1, summoner_name_2)
      should return an array of summoners with name set
  #stats
    #ranked(summoner_name)
      should return ranked information from a given summoner name
    #summary(summoner_name)
      should return summary information from a given summoner id
  #champions
    #list
      should return a list of all champions
    #free
      should return a list of all free champions
  #game
    #recent(summoner_name)
      should return a list of recent games played from a given summoner id
  #league
    #by_summoner(summoner_name)
      should return leagues data from a given summoner id
  #team
    #by_summoner(summoner_id)
      should return team data from a given summoner id
```

## ChangeLog / History / Releases

see the [CHANGELOG.md](./CHANGELOG.md) file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Testing

```shell
bundle install
```

If adding new test:

```shell
RECORDING=1 RIOT_API_KEY=your-api-key rspec
```

If running existing tests:

```shell
rspec
```

### Contributors

* [@pcg79](https://github.com/pcg79)

For more information and a complete list see [the contributor page on GitHub](https://github.com/petems/riot_api/contributors).

## License

[MIT](./LICENSE)

## Thanks

* [@rmoriz](https://github.com/rmoriz) - For the excellent [digital_ocean](https://github.com/rmoriz/digital_ocean) gem, which I used as a framework to setup this gem! :+1:

