FROM ubuntu:bionic
LABEL maintainer="Kazumichi Yamamoto <yamamoto.febc@gmail.com>"
MAINTAINER Kazumichi Yamamoto <yamamoto.febc@gmail.com>

RUN apt-get update && apt-get -y install git jq && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENV GHCH_VERSION=0.3.0
ENV HUB_VERSION=2.6.0

ADD https://github.com/Songmu/ghch/releases/download/v${GHCH_VERSION}/ghch_v${GHCH_VERSION}_linux_amd64.tar.gz ghch.tar.gz
RUN tar zxvf ghch.tar.gz && \
    mv ghch_v${GHCH_VERSION}_linux_amd64/ghch /usr/local/bin/ && \
    rm -rf ghch_v${GHCH_VERSION}_linux_amd64

ADD https://github.com/github/hub/releases/download/v${HUB_VERSION}/hub-linux-amd64-${HUB_VERSION}.tgz hub.tar.gz
RUN tar zxvf hub.tar.gz && \
    mv hub-linux-amd64-${HUB_VERSION}/bin/hub /usr/local/bin/ && \
    rm -rf hub-linux-amd64-${HUB_VERSION}

ADD entrypoint.sh /entrypoint.sh
ADD header.txt /header.txt
WORKDIR /workdir
ENTRYPOINT ["/entrypoint.sh"]
