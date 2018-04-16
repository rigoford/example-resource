FROM alpine:3.7

ENV GCLOUD_SDK_VERSION=197.0.0
ENV GCLOUD_SDK_URL=https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz

RUN apk add --update \
      curl \
      jq && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /opt && \
    cd /opt && \
    wget -q -O - $GCLOUD_SDK_URL |tar zxf - && \
    /opt/google-cloud-sdk/install.sh -q
