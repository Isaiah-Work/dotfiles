#!/bin/bash

# Este script automatiza la instalación de dependencias y la configuración de dotfiles.

# --- 1. DETECCIÓN DEL SISTEMA Y DEFINICIÓN DE PAQUETES ---

# Define la lista de paquetes necesarios
PACKAGES=(
    i3                             # Gestor de ventanas
    picom                          # Compositor
    polybar                        # Barra de estado
    rofi                           # Lanzador de aplicaciones
    alacritty                      # Terminal
    feh                            # Fondo de pantalla
    i3lock                         # Bloqueo de pantalla
    brightnessctl                  # Control de brillo
    pulseaudio                     # Control de volumen
    dex                            # Gestor de autostart XDG
    nm-applet                      # Applet de red
    xss-lock                       # Bloqueo de pantalla integrado
    git
    wget
    curl
)

# Definición de comandos de instalación basados en la distribución
if [ -x "$(command -v apt)" ]; then
    INSTALL_CMD="sudo apt install -y"
elif [ -x "$(command -v pacman)" ]; then
    INSTALL_CMD="sudo pacman -S --noconfirm"
elif [ -x "$(command -v dnf)" ]; then
    INSTALL_CMD="sudo dnf install -y"
else
    echo "ERROR: Distribución no soportada o gestor de paquetes no encontrado. Instala manualmente."
    exit 1
fi

echo "Iniciando instalación en $(awk -F= '/^NAME/{print $2}' /etc/os-release)..."

# --- 2. INSTALACIÓN DE DEPENDENCIAS ---

echo "Instalando paquetes del sistema..."
$INSTALL_CMD "${PACKAGES[@]}"

# --- 3. INSTALACIÓN DE FUENTES (Ejemplo para JetBrains Mono Nerd Font) ---
echo "Verificando e instalando fuentes esenciales (JetBrains Mono Nerd Font)..."
# Nota: La instalación de fuentes puede variar. Este es un ejemplo simple de descarga.
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"

if command -v curl >/dev/null 2>&1; then
    curl -Lo /tmp/JetBrainsMono.zip "$FONT_URL"
    unzip -o /tmp/JetBrainsMono.zip -d "$FONT_DIR/JetBrainsMono"
    rm /tmp/JetBrainsMono.zip
    fc-cache -fv
    echo "Fuentes instaladas y caché actualizada."
else
    echo "ADVERTENCIA: 'curl' no encontrado. Instala JetBrainsMono Nerd Font manualmente."
fi


# --- 4. CONFIGURACIÓN DE DOTFILES (ENLACES SIMBÓLICOS) ---

echo "Creando enlaces simbólicos para la configuración..."
DOTFILES_DIR=$(pwd) # Obtiene el directorio actual (~/Dotfiles)
CONFIG_DIR="$HOME/.config"

# Crea el directorio de configuración si no existe
mkdir -p "$CONFIG_DIR"

# Lista de carpetas a enlazar (Symlinks)
FOLDERS=("i3" "picom" "polybar" "rofi" "alacritty")

for FOLDER in "${FOLDERS[@]}"; do
    # Verifica si ya existe una configuración, si es así, la respalda o la borra
    if [ -d "$CONFIG_DIR/$FOLDER" ] && [ ! -L "$CONFIG_DIR/$FOLDER" ]; then
        echo "Copia de seguridad de ~/.config/$FOLDER a ~/.config/$FOLDER.bak"
        mv "$CONFIG_DIR/$FOLDER" "$CONFIG_DIR/$FOLDER.bak"
    fi
    
    # Crea el enlace simbólico
    ln -sfn "$DOTFILES_DIR/.config/$FOLDER" "$CONFIG_DIR/$FOLDER"
    echo "Enlace creado para $FOLDER."
done

echo "¡Configuración de Dotfiles completada! Por favor, reinicia tu entorno de i3."
