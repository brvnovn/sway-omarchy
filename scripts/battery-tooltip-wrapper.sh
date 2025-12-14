#!/bin/bash
# Script wrapper para obter informações da bateria com perfil de energia
# Este script será usado para atualizar o tooltip da bateria dinamicamente

# Obter perfil de energia
PROFILE=$(powerprofilesctl get 2>/dev/null || echo "unknown")

# Capitalizar primeira letra para exibição
if [ "$PROFILE" = "performance" ]; then
    PROFILE_DISPLAY="Performance"
elif [ "$PROFILE" = "balanced" ]; then
    PROFILE_DISPLAY="Balanced"
elif [ "$PROFILE" = "power-saver" ]; then
    PROFILE_DISPLAY="Power Saver"
else
    PROFILE_DISPLAY="Unknown"
fi

echo "$PROFILE_DISPLAY"

