# 🚀 Dotfiles de i3: Un Entorno Minimalista y Funcional

Este repositorio contiene la configuración completa de mi entorno de escritorio en Linux, basado en el gestor de ventanas tipo mosaico (**i3-gaps**). El objetivo es lograr un flujo de trabajo 100% eficiente y basado en teclado (conocido como *ricing*), combinado con una estética moderna gracias a la composición de Picom.

---

## 💻 Componentes del Entorno

| Componente | Archivo de Configuración | Función |
| :--- | :--- | :--- |
| **Gestor de Ventanas** | `.config/i3/config` | El núcleo del escritorio. Configurado con **Gaps** (separación), atajos VIM-like y comandos de sesión. |
| **Compositor** | `.config/picom/picom.conf` | Añade los efectos visuales modernos: **sombras**, **transparencia** y **esquinas redondeadas**. |
| **Barra de Estado** | `.config/polybar/` | Una barra de estado minimalista y elegante. Muestra información dinámica del sistema (audio, CPU, batería). |
| **Lanzador** | `.config/rofi/` | Un menú de aplicaciones rápido y con búsqueda, sustituyendo a Dmenu. |
| **Terminal** | `kitty` (dependencia) | Emulador de terminal de alto rendimiento y acelerado por GPU. |

---

## 🛠️ Guía de Instalación Rápida

1.  **Instalar Dependencias Iniciales:**

    Necesitarás `git`, `wget` y `curl` para descargar el repositorio y el instalador de Oh My Zsh.

    ```bash
    # Distribuciones basadas en Debian/Ubuntu
    sudo apt update
    sudo apt install git wget curl

    # Distribuciones basadas en Fedora/CentOS
    sudo dnf update
    sudo dnf install git wget curl

    # Distribuciones basadas en Arch/Manjaro
    sudo pacman -Syu git wget curl
    ```

2.  **Clonar el Repositorio:**
    ```bash
    git clone [https://github.com/Isaiah-Work/dotfiles.git](https://github.com/Isaiah-Work/dotfiles.git) ~/Dotfiles
    cd ~/Dotfiles
    ```

3.  **Ejecutar el Instalador:**
    ```bash
    chmod +x install.sh
    ./install.sh
    ```
    El script se encargará de instalar el resto de dependencias y de crear los enlaces simbólicos (*symlinks*) en tu carpeta `~/.config/`.
---

## 👏 Agradecimientos y Referencias

La construcción de estos *dotfiles* fue inspirada y guiada por el excelente contenido y las prácticas de la comunidad de Linux en YouTube. Un agradecimiento especial a:

* **Linux en Casa:** [Transparencias en BSPWM con Picom [Linux Debian 12 Bookworm]](https://www.youtube.com/watch?v=zzPJCMl11k4)
* **Eric Murphy:** [How to Use and Configure Picom (Transparent Windows, Blurred Backgrounds & More)](https://www.youtube.com/watch?v=lxRAj1Gijic)
* **The Linux Cast:** [How to Configure i3wm - The Ultimate Guide! (2022)](https://www.youtube.com/watch?v=wXZgUudR41I)

---

## ⌨️ Comandos Esenciales de i3 (Modificador: $mod = Tecla Super/Windows)

| Función | Atajo de Teclado | Descripción |
| :--- | :--- | :--- |
| **Terminal** | `$mod + Enter` | Abre el emulador de terminal Alacritty. |
| **Lanzador** | `$mod + space` | Abre Rofi para buscar aplicaciones. |
| **Cerrar Ventana** | `$mod + q` | Cierra la ventana enfocada. |
| **Recargar Config.** | `$mod + Shift + c` | Recarga el archivo de configuración de i3. |
| **Reiniciar i3** | `$mod + Shift + r` | Reinicia i3 (útil para actualizar sin perder la sesión). |
| **Salir de i3** | `$mod + Shift + e` | Finaliza la sesión de i3. |
| **Redimensionar (Mouse)** | `$mod + Clic Derecho` | Activa el redimensionamiento en **ventanas flotantes**. |
| **Redimensionar (Modo)** | `$mod + r` | Entra en el modo de redimensionamiento con el teclado. |

### Navegación y Movimiento (VIM-Like)

| Acción | Atajo (Teclado) | Comando |
| :--- | :--- | :--- |
| **Enfocar Izquierda** | `$mod + j` | `focus left` |
| **Enfocar Abajo** | `$mod + k` | `focus down` |
| **Enfocar Arriba** | `$mod + l` | `focus up` |
| **Enfocar Derecha** | `$mod + ;` | `focus right` |
| **Mover Izquierda** | `$mod + Shift + j` | `move left` |
| **Mover Abajo** | `$mod + Shift + k` | `move down` |
| **Mover Arriba** | `$mod + Shift + l` | `move up` |
| **Mover Derecha** | `$mod + Shift + ;` | `move right` |

### Layout y Estilo de Ventanas

| Acción | Atajo (Teclado) | Comando |
| :--- | :--- | :--- |
| **División Horizontal** | `$mod + h` | `split h` |
| **División Vertical** | `$mod + v` | `split v` |
| **Layout Apilado** | `$mod + s` | `layout stacking` |
| **Layout Pestañas** | `$mod + w` | `layout tabbed` |
| **Alternar Layout** | `$mod + e` | `layout toggle split` |
| **Alternar Flotante** | `$mod + Shift + space` | `floating toggle` |
| **Pantalla Completa** | `$mod + f` | `fullscreen toggle` |
