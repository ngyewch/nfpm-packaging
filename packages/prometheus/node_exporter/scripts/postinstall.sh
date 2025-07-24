#!/bin/sh

set -e

case "$1" in
  configure|1|2)
    if [ ! -f /etc/default/node_exporter ]; then
      echo 'NODE_EXPORTER_OPTS=""' > /etc/default/node_exporter
    fi
    systemctl daemon-reload
  ;;

  abort-upgrade|abort-remove|abort-deconfigure)
  ;;

  *)
    echo "postinstall.sh called with unknown argument '$1'" >&2
    exit 1
  ;;
esac

exit 0
