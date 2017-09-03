FROM gliderlabs/alpine:latest

ENV BUILD_PACKAGES curl-dev ruby-dev build-base nano
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler

ENV APP_HOME /app

RUN apk update && apk upgrade
RUN apk add --no-cache $BUILD_PACKAGES \
                       $RUBY_PACKAGES \
    && mkdir -p $APP_HOME

COPY app $APP_HOME/
WORKDIR $APP_HOME

RUN bundle install
RUN chmod +x build.sh

EXPOSE 6677
CMD ["sh","build.sh"]
