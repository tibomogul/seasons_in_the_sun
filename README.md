# SeasonsInTheSun

Given a datetime, what is the season?

Current version 0.0.1 has the Modern Mid-Latitude Meteorological reckoning implemented. For the Northern hemisphere, spring begins on 1 March, summer on 1 June, autumn on 1 September, and winter on 1 December. For the Southern hemisphere, spring begins on 1 September, summer on 1 December, autumn on 1 March, and winter on 1 June.

## Installation

Add this line to your application's Gemfile:

    gem 'seasons_in_the_sun'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seasons_in_the_sun

## Usage

    SeasonsInTheSun[:modern_mid_latitude_meteorological].lookup(DateTime.new(2013,12,1))

## Contributing

1. Fork it ( http://github.com/<my-github-username>/seasons_in_the_sun/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
