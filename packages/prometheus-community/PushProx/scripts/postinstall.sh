#!/bin/sh

set -e

case "$1" in
  configure|1|2)
    if [ ! -f /etc/default/pushprox-proxy ]; then
      echo 'PUSHPROX_PROXY_OPTS=""' > /etc/default/pushprox-proxy
    fi
    if [ ! -f /etc/default/pushprox-client ]; then
      echo 'PUSHPROX_CLIENT_OPTS=""' > /etc/default/pushprox-client
    fi
  ;;
esac

systemctl --system daemon-reload >/dev/null || true

exit 0
