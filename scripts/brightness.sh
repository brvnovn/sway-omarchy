#!/bin/bash
# Script para obter e exibir o brilho atual do monitor

# Obter brilho atual (em porcentagem)
BRIGHTNESS=$(brightnessctl get 2>/dev/null)
MAX_BRIGHTNESS=$(brightnessctl max 2>/dev/null)

if [ -z "$BRIGHTNESS" ] || [ -z "$MAX_BRIGHTNESS" ] || [ "$MAX_BRIGHTNESS" -eq 0 ]; then
    echo '{"text": "󰃞", "tooltip": "Brightness: N/A", "class": ""}'
    exit 0
fi

# Calcular porcentagem
PERCENTAGE=$((BRIGHTNESS * 100 / MAX_BRIGHTNESS))

# Selecionar ícone baseado na porcentagem
if [ "$PERCENTAGE" -eq 0 ]; then
    ICON="󰃞"
elif [ "$PERCENTAGE" -lt 33 ]; then
    ICON="󰃝"
elif [ "$PERCENTAGE" -lt 66 ]; then
    ICON="󰃟"
else
    ICON="󰃠"
fi

# Retornar JSON para waybar
echo "{\"text\": \"$ICON\", \"tooltip\": \"Brightness: $PERCENTAGE%\", \"class\": \"\"}"

