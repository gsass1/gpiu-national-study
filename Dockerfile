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

# Install gems
COPY Gemfile* /app/
RUN bundle install --without development test

# Install JS dependencies
COPY package.json yarn.lock /app/
RUN yarn install --check-files

COPY . /app
RUN bundle exec rake assets:precompile RAILS_ENV=production

EXPOSE 3000
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["rails", "server",  "-b", "0.0.0.0", "-e", "production"]
