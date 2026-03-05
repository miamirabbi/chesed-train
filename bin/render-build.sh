#!/usr/bin/env bash
# exit on error
set -o errexit

# Install Ruby dependencies
bundle install

# Install Node dependencies
yarn install

# Build JavaScript
yarn build

# Build Tailwind CSS
bundle exec rails tailwindcss:build

# Precompile assets
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Run database migrations
bundle exec rails db:migrate
