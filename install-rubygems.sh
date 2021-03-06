#! /usr/bin/env bash

set -e
echo "installing gems"
GEMS="heroku jekyll github-pages bundler"
# 10.12 needs a sudoer to install gems.
if [[ `defaults read loginwindow SystemVersionStampAsString` =~ 10\.12 ]]; then
    echo "Need sudoer access to install gems."
    sudo gem install $GEMS
else
    echo "Installing gems normally..."
    gem install $GEMS
fi
