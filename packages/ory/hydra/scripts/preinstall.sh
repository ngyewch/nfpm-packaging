#!/bin/sh

set -e

SERVICE_USER=ory
SERVICE_GROUP=ory

case "$1" in
  install|upgrade|1|2)
    groupadd --system --force ${SERVICE_GROUP}
    SERVICE_GROUP_ID=$(getent group ${SERVICE_GROUP} | cut -d: -f3)
    adduser --system --gid ${SERVICE_GROUP_ID} --no-create-home ${SERVICE_USER}
    mkdir -p /etc/ory/hydra
  ;;

  *)
    echo "preinstall.sh called with unknown argument '$1'" >&2
    exit 1
  ;;
esac

exit 0
