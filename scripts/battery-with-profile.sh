#!/bin/bash
# Script para obter informações da bateria com perfil de energia
# Este script será usado para atualizar o tooltip da bateria

# Obter perfil de energia
PROFILE=$(powerprofilesctl get 2>/dev/null || echo "unknown")

# Capitalizar primeira letra
PROFILE_CAPITALIZED=$(echo "$PROFILE" | sed 's/.*/\u&/')

echo "$PROFILE_CAPITALIZED"

