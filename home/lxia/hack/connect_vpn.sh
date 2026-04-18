#!/bin/bash

source ~/.auth/credentials

FILE='/tmp/.vpn-auth.txt'
NAME='Beijing (PEK2 Alternate)'

if (nmcli connection show --active | grep -q "$NAME") ; then
    echo "vpn is already running"
    exit 0
else
    echo "vpn is not running"
    TOKEN="$(oathtool --totp -b "$VPN_SECRET")"
    echo "vpn.secrets.password:${PIN}${TOKEN}" > "$FILE"

    nmcli --ask connection up "$NAME" passwd-file "$FILE" || true
    rm -f "$FILE"
fi
