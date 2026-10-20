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
echo "=== DB migration status BEFORE ==="
bundle exec rails db:migrate:status || true
echo "=== Running db:migrate ==="
bundle exec rails db:migrate
echo "=== DB migration status AFTER ==="
bundle exec rails db:migrate:status || true
