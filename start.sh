#!/usr/bin/env bash

#Git clone app
cd /app && https://github.com/appdesign1987/lamernews.git

#Running bundle
cd /app/lamernews && bundle install

#installing gems
gem install bundler
gem install sinatra -v 1.4.2
gem install redis -v 3.0.4
gem install hiredis -v 0.4.5
gem install json -v 1.7.7
gem install ruby-hmac -v 0.4.0

#starting application
cd /app/lamernews && bundle exec rackup -p4567 --host 0.0.0.0
