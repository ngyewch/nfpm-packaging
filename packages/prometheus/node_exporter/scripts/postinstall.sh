#!/bin/sh

set -e

case "$1" in
  configure|1|2)
    if [ ! -f /etc/default/node_exporter ]; then
      echo 'NODE_EXPORTER_OPTS=""' > /etc/default/node_exporter
    fi
  ;;
esac

systemctl --system daemon-reload >/dev/null || true

exit 0
