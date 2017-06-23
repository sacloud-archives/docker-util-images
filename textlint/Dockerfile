FROM node:8.1
MAINTAINER Kazumichi Yamamoto <yamamoto.febc@gmail.com>
LABEL MAINTAINER 'Kazumichi Yamamoto <yamamoto.febc@gmail.com>'

RUN npm install -g --no-cache textlint \
    textlint-filter-rule-whitelist \
    textlint-filter-rule-comments \
    textlint-rule-common-misspellings \
    textlint-rule-preset-ja-technical-writing

WORKDIR /workdir
ENTRYPOINT ["textlint"]
