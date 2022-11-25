FROM ruby:3.1.3-alpine3.15 as BUILDER

RUN apk update && apk -U upgrade \
    && apk add build-base \
    openssh \
    nodejs \
    git \
    postgresql-dev \
    tzdata \
    yarn

WORKDIR /app

# Install gems
COPY Gemfile* /app/

RUN git --version

RUN bundle config set with production \
    && bundle config set without 'development test' \
    && bundle install -j4 --retry 3 \
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete

# Install JS dependencies
COPY package.json yarn.lock /app/
RUN yarn install --production

# Copy the app source
COPY . /app/

# Precompile assets
RUN bundle exec rake assets:precompile RAILS_ENV=production

# Remove folders not needed in resulting image
RUN rm -rf node_modules tmp/cache vendor/assets lib/assets spec

FROM ruby:3.1.3-alpine3.15

RUN apk update && apk -U upgrade \
    && apk add tini \
    postgresql-client \
    tzdata

RUN adduser -D -h /app gpiu
USER gpiu

COPY --from=BUILDER /usr/local/bundle/ /usr/local/bundle/
COPY --from=BUILDER --chown=gpiu:gpiu /app /app

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["rails", "server",  "-b", "0.0.0.0", "-e", "production"]
