FROM ruby:2

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENV PORT 8080
EXPOSE 8080

CMD ["ruby", "./app.rb"]