# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seasons_in_the_sun/version'

Gem::Specification.new do |spec|
  spec.name          = "seasons_in_the_sun"
  spec.version       = SeasonsInTheSun::VERSION
  spec.authors       = ["Tibo Mogul"]
  spec.email         = ["tibo.mogul@gmail.com"]
  spec.summary       = %q{Ruby class that takes a datetime object and determines the season}
  spec.description   = %q{Ruby class that takes a datetime object and determines the season}
  spec.homepage      = "https://github.com/tibomogul/seasons_in_the_sun"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"
end
