#!/bin/bash

# Obtener el color de fondo del archivo colors.ini
COLOR_FONDO=$(grep "in_primary" ~/.config/polybar/colors.ini | awk '{print $3}')

# Obtener el porcentaje de batería
BATERIA=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}' | tr -d '%')

ESTADO=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{print $2}')

# Función para asignar el icono basado en el nivel de batería
get_icon() {
    case $1 in
        0|1|2|3|4|5|6|7|8|9) echo "󰂃" ;;
        1[0-9]) echo "󰁺" ;;
        2[0-9]) echo "󰁻" ;;
        3[0-9]) echo "󰁼" ;;
        4[0-9]) echo "󰁽" ;;
        5[0-9]) echo "󰁾" ;;
        6[0-9]) echo "󰁿" ;;
        7[0-9]) echo "󰂀" ;;
        8[0-9]) echo "󰂁" ;;
        9[0-9]) echo "󰂂" ;;
        100) echo "󰁹" ;;
        *) echo "?" ;;
    esac
}

# Obtener el icono
ICONO=$(get_icon $BATERIA)

if [ "$ESTADO" = "charging" ] || [ "$ESTADO" = "fully-charged" ]; then
    ICONO="󰂄"  # Icono de rayo o cargando
fi

# Imprimir el resultado
echo "%{F$COLOR_FONDO}$ICONO $BATERIA%{F-}"
