#!/bin/sh

set -e

case "$1" in
  remove|0)
    systemctl stop "oauth2-proxy@*" >/dev/null || true
  ;;
esac

exit 0
