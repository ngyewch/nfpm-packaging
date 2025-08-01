#!/bin/sh

set -e

SERVICE_USER=ory
SERVICE_GROUP=ory

case "$1" in
  install|upgrade|1|2)
    useradd --system --user-group --home-dir /var/lib/${SERVICE_USER} --create-home --shell /sbin/nologin ${SERVICE_USER} \
        || EXIT_CODE=$? \
        && [ -n "${EXIT_CODE+set}" ] && [ "${EXIT_CODE}" -ne 9 ] \
        && exit ${EXIT_CODE}
    mkdir -p /etc/ory/oathkeeper /var/lib/${SERVICE_USER}/oathkeeper
  ;;
esac

exit 0
