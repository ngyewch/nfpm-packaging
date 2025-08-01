#!/bin/sh

set -e

case "$1" in
  remove|0)
    systemctl stop "hydra@*" >/dev/null || true
  ;;
esac

exit 0
