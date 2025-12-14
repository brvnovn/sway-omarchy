#!/bin/bash
# Script para obter o perfil de energia atual
powerprofilesctl get 2>/dev/null || echo "unknown"

