#!/bin/bash
# Script para alternar o estado do monitor integrado

INTERNAL_MONITOR="eDP-1"

# Verificar se o monitor está ativo
MONITOR_INFO=$(hyprctl monitors -j 2>/dev/null | jq -r ".[] | select(.name == \"$INTERNAL_MONITOR\")" 2>/dev/null)

if [ -z "$MONITOR_INFO" ]; then
    # Monitor está desativado, ativar
    # Primeiro, obter a configuração original do monitor (se disponível)
    # Se não houver configuração salva, usar valores padrão
    hyprctl keyword monitor "$INTERNAL_MONITOR,preferred,auto,1" 2>/dev/null
else
    # Monitor está ativo, desativar
    hyprctl keyword monitor "$INTERNAL_MONITOR,disable" 2>/dev/null
fi

# Aguardar um pouco para o estado mudar
sleep 0.3

# Sinalizar o waybar para atualizar
pkill -SIGRTMIN+1 waybar 2>/dev/null || true

