FROM ruby:2.7.1-alpine3.11
WORKDIR /app

RUN apk update && apk -U upgrade \
    && apk add build-base \
    tini \
    openssh \
    nodejs \
    git \
    postgresql-dev \
    tzdata \
    yarn

COPY Gemfile* /app/

RUN bundle install

COPY . /app

EXPOSE 3000

RUN bundle exec rake assets:precompile RAILS_ENV=production SECRET_KEY_BASE=placeholder

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["rails", "server", "-b", "0.0.0.0"]
