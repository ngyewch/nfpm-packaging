#!/bin/sh

set -e

SERVICE_USER=oauth2-proxy

case "$1" in
  install|upgrade)
    id -u ${SERVICE_USER} > /dev/null 2>&1 || adduser --system --no-create-home --quiet ${SERVICE_USER}
    mkdir -p /etc/oauth2-proxy
  ;;

  *)
    echo "preinstall.sh called with unknown argument '$1'" >&2
    exit 1
  ;;
esac

exit 0
