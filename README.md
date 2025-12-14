# Sway Omarchy - Configuração Waybar

Configuração personalizada do Waybar para uso com Sway e Omarchy.

## Funcionalidades

- **Módulo de Bateria**: Exibe informações da bateria com perfil de energia no tooltip
- **Módulo de Brilho**: Controle de brilho do monitor com scroll do mouse
- **Integração Omarchy**: Configuração otimizada para uso com Omarchy

## Requisitos

- `waybar`
- `powerprofilesctl` (para perfis de energia)
- `brightnessctl` (para controle de brilho)
- `omarchy` (framework de configuração)

## Estrutura

```
waybar/
├── config.jsonc          # Configuração principal do Waybar
├── style.css             # Estilos CSS personalizados
├── scripts/              # Scripts auxiliares
│   ├── brightness.sh    # Script para controle de brilho
│   └── battery-with-profile-tooltip.sh  # Script para tooltip da bateria com perfil
└── README.md            # Este arquivo
```

## Instalação

1. Clone este repositório ou copie os arquivos para `~/.config/waybar/`
2. Certifique-se de que todos os scripts têm permissão de execução:
   ```bash
   chmod +x ~/.config/waybar/scripts/*.sh
   ```
3. Reinicie o Waybar

## Uso

### Módulo de Bateria

O módulo de bateria exibe informações da bateria e, ao passar o mouse sobre ele, mostra o perfil de energia atual (Performance, Balanced ou Power Saver).

### Módulo de Brilho

O módulo de brilho permite controlar o brilho do monitor usando o scroll do mouse:
- **Scroll para cima**: Aumenta o brilho em 5%
- **Scroll para baixo**: Diminui o brilho em 5%

## Personalização

Os scripts podem ser modificados em `scripts/` para ajustar o comportamento conforme necessário.

## Licença

Este projeto faz parte da configuração Omarchy.

