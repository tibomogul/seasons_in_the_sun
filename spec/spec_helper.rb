require 'rubygems'
require 'bundler/setup'
# require 'rspec'
require 'seasons_in_the_sun'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end