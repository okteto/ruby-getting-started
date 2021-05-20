FROM ruby:2 AS builder

# setup okteto message
COPY bashrc /root/.bashrc

ENV RUBYOPT "-W:no-deprecated"

WORKDIR /opt/app
COPY Gemfile Gemfile.lock /opt/app/
RUN bundle config set frozen 'true'
RUN bundle install

COPY . /opt/app/

ENV PORT 8080
EXPOSE 8080

CMD ["ruby", "./app.rb"]
