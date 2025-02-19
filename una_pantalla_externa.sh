#!/bin/bash

monitor_medio='DVI-I-1-1'
monitor_izquierda='DVI-I-2-2'
monitor_derecha='HDMI-1'
monitor_portatil='eDP-1'

monitores_conectados=$(xrandr --query | grep HDMI-1 | awk '{print $2}')

if [[ $monitores_conectados = 'connected' ]]; then

  echo "monitores conectados"

  xrandr  --output $monitor_izquierda --mode 1920x1080 --rotate left --output $monitor_medio --primary --mode 3840x2160 --right-of $monitor_izquierda --rotate normal --output $monitor_derecha --mode 1920x1080 --rotate normal --right-of $monitor_medio --output $monitor_portatil --right-of $monitor_derecha 

  bspc monitor $monitor_derecha -d I
  bspc monitor $monitor_medio -d II
  bspc monitor $monitor_izquierda -d III
  bspc monitor $monitor_portatil -d IV

  sleep 1 

  xrandr --output $monitor_portatil --off




else

  echo "monitores desconectados"

  bspc monitor -d I II III IV V VI VII VIII IX X

fi


