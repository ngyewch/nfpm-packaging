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
    mkdir -p /etc/ory/hydra /var/lib/${SERVICE_USER}/hydra
  ;;

  *)
    echo "preinstall.sh called with unknown argument '$1'" >&2
    exit 1
  ;;
esac

exit 0
