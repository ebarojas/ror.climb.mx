#!/bin/bash
set -e

# Install gems first
echo "Installing gems..."
bundle install

# Remove a potentially pre-existing server.pid for Rails
rm -f /app/tmp/pids/server.pid

# Wait for database to be ready
until pg_isready -h db -p 5432 -U postgres; do
  echo "Waiting for database..."
  sleep 2
done

# Run database migrations
echo "Running database migrations..."
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:create db:migrate

# Seed database if needed
if [ "$RAILS_ENV" = "development" ]; then
  echo "Seeding database..."
  bundle exec rails db:seed 2>/dev/null || true
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@" 