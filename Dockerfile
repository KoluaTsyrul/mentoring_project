FROM ruby:2.5.0

RUN apk update && \
    apk add build-base && \
    apk add g++ gcc unixodbc-dev unixodbc freetds-dev freetds

RUN apk update &&\
    apk add --update alpine-sdk \
               build-base

RUN mkdir cucumber
WORKDIR /cucumber
COPY Gemfile .

RUN gem install bundler --source http://rubygems.org &&\
    bundle install