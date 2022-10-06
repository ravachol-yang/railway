FROM ruby:3.1.2-slim-bullseye

# Common dependencies
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
        build-essential \
        gnupg2 \
        curl \
        less \
        git \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

# Create app dir
RUN mkdir -p /app
WORKDIR /app

RUN gem update --system && \
    gem install rails

# Use Bash
CMD ["/usr/bin/bash"]


