#/bin/bash

export VERSION=$1

echo "module Fitbit VERSION = '$VERSION'; end" > ./lib/fitbit/version.rb

git add .
git commit -m "updating gem to version to $VERSION"
git tag v$VERSION

gem build fitbit.gemspec
gem inabox fitbit-api-client-$VERSION.gem -g http://fitmo:g3mS3rv3r@rubygem.fitmo.com:9292

rm fitbit-api-client-$VERSION.gem
