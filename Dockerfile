FROM node:8.5-alpine
MAINTAINER Tomoya <tomoyadeng@gmail.com>

RUN npm --registry=http://registry.npm.taobao.org -g install gitbook-cli

ARG GITBOOK_VERSION=3.2.3
RUN gitbook fetch $GITBOOK_VERSION

ARG PROJECT_DIR=/app/wiki
ENV BOOKDIR $PROJECT_DIR

VOLUME $BOOKDIR
WORKDIR $BOOKDIR

EXPOSE 4000
#ENV VIRTUAL_PORT 4000
#ENV VIRTUAL_HOST wiki.foresh.com

ENTRYPOINT $BOOKDIR/build.sh
