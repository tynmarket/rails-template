# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
FROM ruby:3.2-slim as base

# Rails app lives here
WORKDIR /app

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Nginxなしの場合
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
CMD ["bundle", "exec", "puma"]
