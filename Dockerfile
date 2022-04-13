FROM ruby:3.1.2-slim

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL

ARG FPM_VERSION
ENV FPM_VERSION=${FPM_VERSION:-1.11.0}

# metadata
LABEL maintainer="Alexander Wolff <wolffaxn@gmail.com>" \
  org.label-schema.build-date=${BUILD_DATE} \
  org.label-schema.docker.dockerfile="/Dockerfile" \
  org.label-schema.vcs-ref=${VCS_REF} \
  org.label-schema.vcs-url=${VCS_URL}

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
