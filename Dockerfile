FROM ruby:4.0.10-trixie AS dev

RUN gem install debug -v 1.11.1

ENV APP_ENV=development
WORKDIR /opt/app
COPY Gemfile Gemfile.lock ./
RUN BUNDLE_FROZEN=true bundle install
COPY . .

FROM ruby:4.0.10-slim-trixie AS prod

ENV APP_ENV=production
WORKDIR /opt/app
COPY Gemfile Gemfile.lock ./
RUN BUNDLE_FROZEN=true BUNDLE_WITHOUT=test bundle install
COPY . .
CMD ["ruby", "app.rb"]
