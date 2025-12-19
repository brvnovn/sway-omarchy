#!/bin/bash
# Script para controlar o monitor integrado do notebook

INTERNAL_MONITOR="eDP-1"

# Verificar se o monitor está ativo
MONITOR_INFO=$(hyprctl monitors -j 2>/dev/null | jq -r ".[] | select(.name == \"$INTERNAL_MONITOR\")" 2>/dev/null)

if [ -z "$MONITOR_INFO" ]; then
    # Monitor não encontrado ou desativado
    echo '{"text": "󰍹", "tooltip": "Internal Monitor: Off\nClick to enable", "class": "disabled"}'
else
    # Monitor está ativo
    echo '{"text": "󰍺", "tooltip": "Internal Monitor: On\nClick to disable", "class": "enabled"}'
fi

