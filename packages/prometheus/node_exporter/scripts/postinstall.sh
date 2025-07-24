#!/bin/sh

set -e

case "$1" in
  configure|1|2)
    if [ ! -f /etc/default/pushprox_proxy ]; then
      echo 'PUSHPROX_PROXY_OPTS=""' > /etc/default/pushprox_proxy
    fi
    if [ ! -f /etc/default/pushprox_client ]; then
      echo 'PUSHPROX_CLIENT_OPTS=""' > /etc/default/pushprox_client
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
