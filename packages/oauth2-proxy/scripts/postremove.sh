#!/bin/sh

set -e

systemctl --system daemon-reload >/dev/null || true

exit 0
