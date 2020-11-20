FROM ruby:2.7.1-alpine3.12
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

RUN bundle install --without development test

COPY . /app

EXPOSE 3000

RUN yarn install --check-files

RUN bundle exec rake assets:precompile RAILS_ENV=production

RUN yarn install --check-files

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["rails", "server",  "-b", "0.0.0.0", "-e", "production"]
