#!/bin/sh

COLOR_ICONO=#7aa2f7
COLOR_IP=$(cat /home/martin/.config/polybar/colors.ini | grep "in_primary" | awk '{print $3}')

ip=$(/usr/sbin/ifconfig wlp1s0 | grep "inet " | awk '{print $2}')
echo "%{F$COLOR_ICONO}󰈀 %{F$COLOR_IP}$ip%{u-}"
