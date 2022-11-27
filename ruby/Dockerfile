FROM ruby:3.1-alpine

COPY /app /root/app/
WORKDIR /root/app/

RUN gem install bundler
RUN bundle install