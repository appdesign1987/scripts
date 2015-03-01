#!/usr/bin/env bash

#Git clone app
cd /app/data && git clone https://github.com/appdesign1987/lamernews.git

#See if theres some new data on github
cd /app/data/lamernews && git pull https://github.com/appdesign1987/lamernews.git

#installing gems
gem install bundler

#Running bundle
cd /app/data/lamernews && bundle install

#starting application
cd /app/data/lamernews && bundle exec rackup -p4567 --host 0.0.0.0
