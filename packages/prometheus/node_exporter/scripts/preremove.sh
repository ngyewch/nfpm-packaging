#!/bin/sh

set -e

case "$1" in
  remove)
    systemctl stop node_exporter.service >/dev/null || true
esac

exit 0
