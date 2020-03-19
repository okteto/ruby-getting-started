FROM ruby:2 AS builder

WORKDIR /opt/app
COPY Gemfile Gemfile.lock /opt/app/
RUN bundle install

#######################################

FROM builder AS dev

RUN gem install ruby-debug-ide
RUN gem install debase

ENV PORT 8080
EXPOSE 8080

#######################################

FROM ruby:2 AS production

WORKDIR /opt/app
COPY --from=builder /usr/local/ /usr/local/
COPY --from=builder /opt/app/ /opt/app
COPY . /opt/app/

ENV PORT 8080
EXPOSE 8080

CMD ["ruby", "./app.rb"]
