FROM ubuntu:bionic
LABEL maintainer="Kazumichi Yamamoto <yamamoto.febc@gmail.com>"
MAINTAINER Kazumichi Yamamoto <yamamoto.febc@gmail.com>

ADD https://github.com/Songmu/ghch/releases/download/v0.3.0/ghch_v0.3.0_linux_amd64.tar.gz ghch.tar.gz
RUN tar zxvf ghch.tar.gz && \
    mv ghch_v0.3.0_linux_amd64/ghch /usr/local/bin/ && \
    rm -rf ghch_v0.3.0_linux_amd64
RUN apt-get update && apt-get -y install git && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh
ADD header.txt /header.txt
WORKDIR /workdir
ENTRYPOINT ["/entrypoint.sh"]
