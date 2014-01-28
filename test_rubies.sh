#!/usr/bin/env bash

# http://ylan.segal-family.com/blog/2013/06/21/testing-with-multiple-ruby-and-gem-versions/
set -e

rubies=("ruby-2.1.0@seasons_in_the_sun" "ruby-2.0.0@seasons_in_the_sun" "ruby-1.9.3@seasons_in_the_sun")
for i in "${rubies[@]}"
do
  echo "====================================================="
  echo "$i: Start Test"
  echo "====================================================="
  rvm $i exec bundle
  rvm $i exec bundle exec rspec spec
  echo "====================================================="
  echo "$i: End Test"
  echo "====================================================="
done