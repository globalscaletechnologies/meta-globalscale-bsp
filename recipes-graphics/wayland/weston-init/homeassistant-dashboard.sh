#!/bin/bash

info() {
    echo "homeassistant: ${*}"
    logger -t "homeassistant" "${*}"
}

info "Launch Home-Assistant dashboard..."

if test -z "$XDG_RUNTIME_DIR"; then
    export XDG_RUNTIME_DIR=/run/user/`id -u`
    if ! test -d "$XDG_RUNTIME_DIR"; then
        mkdir --parents $XDG_RUNTIME_DIR
        chmod 0700 $XDG_RUNTIME_DIR
    fi
fi

# wait for weston
while [ ! -e  $XDG_RUNTIME_DIR/wayland-1 ] ;
do
    sleep 0.1
done

sleep 1

# wait for home assistant container
while true
do
    status=$(docker inspect "home-assistant" --format='{{.State.Status}}')
    if [ "${status}" == "running" ]; then
        sleep 3
        break
    else
        sleep 2
    fi
done

/usr/bin/chromium \
    --no-sandbox \
    --incognito \
    --disable-pinch \
    --overscroll-history-navigation=0 \
    --enable-wayland-ime \
    --homepage=http://localhost:8123 \
    --kiosk http://localhost:8123 &

exit 0
