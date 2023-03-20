FROM ruby:3.2
RUN mkdir automation
WORKDIR /automation
COPY ./ .
COPY Gemfile /automation/Gemfile
COPY Gemfile.lock /automation/Gemfile.lock
RUN gem install bundler -v 2.4.8 --source http://rubygems.org &&\
    bundle update && \
    bundle install && \
    bundle config --global frozen 0
RUN bundle
ENV args ''
ENTRYPOINT $args