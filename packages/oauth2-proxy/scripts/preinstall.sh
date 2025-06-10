#!/bin/sh

set -e

SERVICE_USER=oauth2-proxy
SERVICE_GROUP=oauth2-proxy

case "$1" in
  install|upgrade)
    addgroup --system --quiet ${SERVICE_GROUP}
    SERVICE_GROUP_ID=$(getent group vagrant | cut -d: -f3)
    adduser --system --gid ${SERVICE_GROUP_ID} --no-create-home --quiet ${SERVICE_USER}
    mkdir -p /etc/oauth2-proxy
  ;;

  *)
    echo "preinstall.sh called with unknown argument '$1'" >&2
    exit 1
  ;;
esac

exit 0
