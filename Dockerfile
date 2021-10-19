FROM ruby:2.7.4-alpine3.13

RUN apk update && apk -U upgrade \
    && apk add build-base \
    tini \
    openssh \
    nodejs \
    git \
    postgresql-dev \
    tzdata \
    yarn

RUN adduser -D -h /app gpiu
USER gpiu

WORKDIR /app

# Install gems
COPY --chown=gpiu Gemfile* /app/

RUN bundle config set with production
RUN bundle install

# Install JS dependencies
COPY --chown=gpiu package.json yarn.lock /app/
RUN yarn install --check-files

COPY --chown=gpiu . /app/

RUN bundle exec rake assets:precompile RAILS_ENV=production

EXPOSE 3000
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["rails", "server",  "-b", "0.0.0.0", "-e", "production"]
