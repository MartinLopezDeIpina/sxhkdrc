#!/bin/sh
COLOR=#73daca
COLOR_IP=$(cat /home/martin/.config/polybar/colors.ini | grep "in_primary" | awk '{print $3}')
 
IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
 
if \[ "$IFACE" = "tun0" ]; then
    echo "%{F$COLOR} %{F$COLOR_IP}$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
else
    echo "%{F$COLOR}󰛧%{u-} Disconnected"
fi
