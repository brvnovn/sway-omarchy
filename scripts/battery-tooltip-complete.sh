#!/bin/bash
# Script para criar tooltip completo da bateria com perfil de energia
# Este script será usado para atualizar o tooltip da bateria via módulo customizado que retorna JSON

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

# Retornar JSON com tooltip formatado
# Este módulo será usado para atualizar o tooltip da bateria
echo "{\"tooltip\": \"Power Profile: $PROFILE_DISPLAY\"}"

