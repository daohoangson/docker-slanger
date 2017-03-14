FROM ruby:2.3.3-alpine

MAINTAINER Dao Hoang Son <daohoangson@gmail.com>

ARG SLANGER_VERSION

ENV SLANGER_MAKE_PACKAGES \
	build-base \
	make

ENV SLANGER_RUN_PACKAGES \
	hiredis \
	libstdc++

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apk add --no-cache --update $SLANGER_MAKE_PACKAGES $SLANGER_RUN_PACKAGES \
	&& gem install slanger -v "$SLANGER_VERSION" \
	&& apk del $SLANGER_MAKE_PACKAGES \
	&& (rm "/tmp/"* 2>/dev/null || true) \
	&& (rm -rf /var/cache/apk/* 2>/dev/null || true)

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 8080 4567
