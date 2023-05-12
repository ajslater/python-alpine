ARG BASE_VERSION
FROM python:$BASE_VERSION
LABEL maintainer="AJ Slater <aj@slater.net>"
LABEL version=python${VERSION}

RUN echo "*** UID/GID Init ***" && \
  apk add --no-cache shadow=4.13-r2
RUN echo "*** create default user ***" && \
  adduser --uid 911 --home /home/abc --shell /bin/sh --disabled-password abc && \
  usermod -G users abc
COPY usr/local/sbin/*.sh /usr/local/sbin/

ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]
