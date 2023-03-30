#!/bin/sh
set -eu

if [ "${PUID:-}${PGID:-}" != ""  ]; then
    /usr/local/sbin/moduser.sh
    LOCAL_USER_SCRIPT=/usr/local/sbin/moduser-local.sh
    if [ -f "$LOCAL_USER_SCRIPT" ]; then
        "$LOCAL_USER_SCRIPT"
    fi
    exec su abc -c "$@"
else
    exec "$@"
fi
