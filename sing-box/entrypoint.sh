#!/bin/sh

mkdir -p /etc/sing-box/devices

cp /opt/show-template /bin/show
chmod +x /bin/show
ln -s /opt/add-device /bin/add-device

if [ ! -f /etc/sing-box/config.json ]; then
        mustpl -d '{"UUID": "${UUID:-SET_UUID}", "PRIVATE_KEY": "${PRIVATE_KEY:-SET_PRIVATE_KEY}", "SHORT_ID": "${SHORT_ID}", "FAKE_SERVER": "${SERVER}", "PORT": "${PORT:-443}", "NAME": "${NAME:-user}", "WIREGUARD_PRIVATE_KEY": "${WIREGUARD_PRIVATE_KEY}"}' -o /etc/sing-box/config.json /opt/config-template-vless.json

    # Create initial device config
    /bin/add-device "${NAME:-user}"
fi

exec "$@"