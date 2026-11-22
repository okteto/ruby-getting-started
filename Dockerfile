FROM ruby:4.0.10-trixie AS dev

# The cache mount keeps Bundler's download cache in the Okteto Build
# Service, which reuses it between builds. The tests of the Okteto
# Manifest use the same cache
RUN --mount=type=cache,target=/usr/local/bundle/cache \
    gem install debug -v 1.11.1

ENV APP_ENV=development
WORKDIR /opt/app
COPY Gemfile Gemfile.lock ./
RUN --mount=type=cache,target=/usr/local/bundle/cache \
    BUNDLE_FROZEN=true bundle install
COPY . .

FROM ruby:4.0.10-slim-trixie AS prod

ENV APP_ENV=production
WORKDIR /opt/app
COPY Gemfile Gemfile.lock ./
RUN --mount=type=cache,target=/usr/local/bundle/cache \
    BUNDLE_FROZEN=true BUNDLE_WITHOUT=test bundle install
COPY . .
CMD ["ruby", "app.rb"]
