#!/bin/bash
# Script para criar tooltip da bateria com perfil de energia
# Este script será usado para atualizar o tooltip da bateria dinamicamente

# Obter perfil de energia
PROFILE=$(powerprofilesctl get 2>/dev/null || echo "unknown")

# Capitalizar primeira letra para exibição
case "$PROFILE" in
    performance)
        PROFILE_DISPLAY="Performance"
        ;;
    balanced)
        PROFILE_DISPLAY="Balanced"
        ;;
    power-saver)
        PROFILE_DISPLAY="Power Saver"
        ;;
    *)
        PROFILE_DISPLAY="Unknown"
        ;;
esac

# Ler informações da bateria do sistema
BATTERY_INFO=$(upower -i $(upower -e | grep 'BAT') 2>/dev/null)

if [ -z "$BATTERY_INFO" ]; then
    # Se não houver bateria, retornar apenas o perfil
    echo "Power Profile: $PROFILE_DISPLAY"
else
    # Extrair informações da bateria
    CAPACITY=$(echo "$BATTERY_INFO" | grep -E "percentage" | awk '{print $2}' | sed 's/%//')
    STATE=$(echo "$BATTERY_INFO" | grep -E "state" | awk '{print $2}')
    ENERGY=$(echo "$BATTERY_INFO" | grep -E "energy-rate" | awk '{print $2}' || echo "N/A")
    
    # Formatar tooltip
    if [ "$STATE" = "discharging" ]; then
        echo "${ENERGY}W↓ ${CAPACITY}%\nPower Profile: $PROFILE_DISPLAY"
    elif [ "$STATE" = "charging" ]; then
        echo "${ENERGY}W↑ ${CAPACITY}%\nPower Profile: $PROFILE_DISPLAY"
    else
        echo "${CAPACITY}%\nPower Profile: $PROFILE_DISPLAY"
    fi
fi
