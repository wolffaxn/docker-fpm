FROM ruby:2.7-slim

ARG BUILD_DATE

ARG FPM_VERSION
ENV FPM_VERSION=${FPM_VERSION:-1.11.0}

# metadata
LABEL maintainer="Alexander Wolff <wolffaxn@gmail.com>" \
  org.label-schema.build-date=${BUILD_DATE}

# dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN set -eux \
  && apt-get update -qq \
  && apt-get install -qq --no-install-recommends \
  gcc \
  locales \
  make \
  && rm -Rf /var/lib/apt/lists/* \
  && apt-get clean

# fpm
RUN set -eux \
  && locale-gen en_US.UTF-8 \
  && gem install fpm -v ${FPM_VERSION}

ENTRYPOINT ["/usr/local/bundle/bin/fpm"]
CMD ["-v"]
