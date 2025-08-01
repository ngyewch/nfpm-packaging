#!/bin/sh

set -e

case "$1" in
  remove|0)
    systemctl stop pushprox-proxy.service >/dev/null || true
    systemctl stop pushprox-client.service >/dev/null || true
  ;;
esac

exit 0
