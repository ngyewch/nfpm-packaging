#!/bin/sh

set -e

case "$1" in
  remove|upgrade|disappear|failed-upgrade|abort-install|abort-upgrade)
  ;;

  purge|0)
    rm -rf /var/lib/prometheus/node_exporter/ \
        /var/log/prometheus/node_exporter.log \
        /var/log/prometheus/node_exporter.log.* \
        /run/prometheus/node_exporter.pid
    # We do NOT remove the system user.
  ;;

  *)
    echo "postremove.sh called with unknown argument '$1'" >&2
    exit 1
  ;;
esac

systemctl --system daemon-reload >/dev/null || true

case "$1" in
  purge|0)
    systemctl purge node_exporter.service >/dev/null || true
  ;;
esac

exit 0
