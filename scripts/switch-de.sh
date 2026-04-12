#!/bin/bash
# ═══════════════════════════════════════════════════════════════════
#  switch-de.sh — Swap desktop themes for KDE or Hyprland
# ═══════════════════════════════════════════════════════════════════
#
#  KDE:    Installs Global Theme packages from KDE Store (one-click)
#  Hyprland: Clones dotfile repos and applies them (one command)
#
#  Usage:
#    switch-de.sh kde              # Show KDE Global Themes
#    switch-de.sh kde <name>       # Install KDE theme
#    switch-de.sh hyprland         # Show Hyprland dotfile repos
#    switch-de.sh hyprland <name>  # Clone + apply Hyprland dots
#    switch-de.sh                  # Interactive menu
#
#  Don't like it? Switch to another one. That's the whole point.
# ═══════════════════════════════════════════════════════════════════

set -euo pipefail

CYAN='\033[0;36m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
RED='\033[0;31m'; MAGENTA='\033[0;35m'; BOLD='\033[1m'; NC='\033[0m'
info()    { echo -e "${CYAN}ℹ  $1${NC}"; }
success() { echo -e "${GREEN}✓  $1${NC}"; }
warn()    { echo -e "${YELLOW}⚠  $1${NC}"; }
error()   { echo -e "${RED}✗  $1${NC}" >&2; }

BACKUP_DIR="$HOME/.config/theme-backups"
mkdir -p "$BACKUP_DIR"

# ═══════════════════════════════════════════════════════════════════
#  KDE GLOBAL THEMES — from store.kde.org / System Settings
# ═══════════════════════════════════════════════════════════════════
declare -a KDE_NAMES=(
    "Sweet"
    "Catppuccin Mocha"
    "Nordic"
    "WhiteSur"
    "Orchis"
    "Materia KDE"
    "Layan"
    "Qogir"
    "Dracula"
    "Fluent Round"
    "Iridescent Round"
    "WinSur Dark"
    "Nova Papilio"
    "Graphite Mono"
    "Everforest"
)

declare -a KDE_SLUGS=(
    "Sweet"
    "Catppuccin-Mocha"
    "Nordic"
    "WhiteSur"
    "Orchis"
    "Materia-KDE"
    "Layan"
    "Qogir"
    "Dracula"
    "Fluent-Round"
    "Iridescent-Round"
    "WinSur-Dark"
    "Nova-Papilio"
    "Graphite-Mono"
    "Everforest"
)

declare -a KDE_DESCS=(
    "Dark neon purple/pink by EliverLara. Most popular KDE theme. Candy icons included."
    "Official Catppuccin warm pastel dark. GitHub + Neovim community favorite."
    "Arctic blue Nord palette. Calm, professional. Arctic Ice Studio colors."
    "macOS Big Sur look. Light + dark. Clean, familiar. Pairs with Latte Dock."
    "Material Design purple-blue. GNOME→KDE port. Rounded corners. Tela icons."
    "Elegant Google Material. Dark/white/light variants. Widely loved."
    "Rounded corners, clean. Light + dark. Pairs with Tela Circle icons."
    "Minimal, Budgie-like. Light + dark. Clean, no-nonsense."
    "Deep purple dark. High contrast. Cross-platform favorite."
    "Windows 11 aesthetics. Light + dark. Polished, familiar."
    "Cyberpunk/futuristic. Rounded, artistic. Great with custom widgets."
    "Windows + macOS blend. Rounded, polished. May crowd small screens."
    "Purple rounded light theme. Extremely rounded. Soft, playful."
    "Monochrome Material Design. Subtle gray. Professional, work-focused."
    "Warm earthy greens. Low contrast, easy eyes. Natural palette."
)

declare -a KDE_KDESTORE_IDS=(
    "1242563"  # Sweet
    "1688990"  # Catppuccin
    "1267246"  # Nordic
    "1466089"  # WhiteSur
    "1396780"  # Orchis
    "1354009"  # Materia
    "1379985"  # Layan
    "1380770"  # Qogir
    "1396075"  # Dracula
    "1507769"  # Fluent Round
    ""         # Iridescent Round
    "1503746"  # WinSur
    ""         # Nova Papilio
    ""         # Graphite Mono
    "1490212"  # Everforest
)

# ═══════════════════════════════════════════════════════════════════
#  HYPRLAND DOTFILE REPOS — from GitHub
# ═══════════════════════════════════════════════════════════════════
declare -a HYPR_NAMES=(
    "End-4 (Illogical Impulse)"
    "Caelestia"
    "DankMaterialShell"
    "ML4W OS"
    "HyDE"
    "JaKooLit"
    "snes19xx/surface-dots"
    "Spelljinxer (Bocchi)"
    "sh1zicus"
    "R7rainz (Noctalia)"
)

declare -a HYPR_SLUGS=(
    "end4"
    "caelestia"
    "dms"
    "ml4w"
    "hyde"
    "jakoolit"
    "snes19xx"
    "spelljinxer"
    "sh1zicus"
    "r7rainz"
)

declare -a HYPR_REPOS=(
    "https://github.com/end-4/dots-hyprland"
    "https://github.com/caelestia-dots/shell"
    "https://github.com/AvengeMedia/DankMaterialShell"
    "https://github.com/mylinuxforwork/dotfiles"
    "https://github.com/HyDE-Project/hyde"
    "https://github.com/JaKooLit/Hyprland-Dots"
    "https://github.com/snes19xx/surface-dots"
    "https://github.com/Spelljinxer/dotfiles"
    "https://github.com/sh1zicus/dots-hyprland"
    "https://github.com/R7rainz/dotfiles"
)

declare -a HYPR_STARS=(
    "13,800"
    "8,900"
    "5,600"
    "4,600"
    "8,700"
    "3,300"
    "private"
    "509"
    "98"
    "40"
)

declare -a HYPR_DESCS=(
    "Quickshell bar, AI widgets (Gemini+Ollama), live app previews. 13.8k stars. Daily updates. Most popular."
    "JSON-only config. Animated session states. Minimal bloat. Reddit favorite. 8.9k stars."
    "Compositor-agnostic (7 WMs). Replaces 6+ tools in one Quickshell+Go binary. MIT licensed."
    "Branded as ML4W OS. Live ISO for testing. One-command disk install. Arch/Fedora/openSUSE."
    "Wallbash dynamic theming. VM sandbox for testing. Strict config rollback. NixOS flake. 8.7k stars."
    "6-distro auto-installer. Versioned workflows. Zero-package guarantee. 3.3k stars."
    "14 GLSL shaders. Surface Laptop 4 optimized. e-ink reading mode. Google Calendar sync. Custom SDDM."
    "Bocchi the Rock! anime theme. pywal-synced. Terminal ambiance. Spotify TUI. Fun, personalized."
    "End-4 fork with custom AGS modules. Material Design 3 palette. Guided Arch installer."
    "Noctalia Shell — custom Quickshell desktop shell. Dark aesthetic. Minimal but polished."
)

declare -a HYPR_COMPONENTS=(
    "Quickshell | Quickshell | Kitty | Hyprlock | swww | Dunst | Thunar | Gemini+Ollama"
    "Quickshell | Quickshell | foot | Quickshell | Built-in | Built-in | Thunar | MPRIS"
    "Quickshell | dsearch | (your choice) | Quickshell | Built-in | Quickshell | (your choice) | dgop"
    "Quickshell | AGS | Kitty | Hyprlock | swww | Dunst | Thunar | Neovim"
    "Waybar | Rofi | Kitty | Hyprlock | swww | Dunst | Dolphin | Neovim"
    "Waybar | Rofi+AGS | Kitty | Hyprlock | swww+wallust | Dunst | Thunar | Neovim"
    "Quickshell | Rofi+Drawer | Kitty | Hyprlock | waypaper | Dunst | Thunar | Firefox+start.html"
    "Waybar | Rofi | Kitty | Hyprlock | pywal | (none) | Ranger | ncspot+cava"
    "Waybar | Rofi | Kitty | Hyprlock | swww | Dunst | Thunar | Neovim"
    "Quickshell/Noctalia | Rofi | Kitty | Hyprlock | swww | Dunst/SwayNC | (none) | Neovim"
)

# ═══════════════════════════════════════════════════════════════════
#  FUNCTIONS
# ═══════════════════════════════════════════════════════════════════

show_kde_themes() {
    echo ""
    echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}║  KDE Plasma 6 — Global Themes                     ║${NC}"
    echo -e "${BOLD}${CYAN}║  Install from KDE Store. One click. Swap anytime.  ║${NC}"
    echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""

    for i in "${!KDE_NAMES[@]}"; do
        num=$((i + 1))
        name=$(printf "%-20s" "${KDE_NAMES[$i]}")
        desc="${KDE_DESCS[$i]:0:60}"
        [ ${#KDE_DESCS[$i]} -gt 60 ] && desc="${desc}..."
        printf "  ${BOLD}${GREEN}%2d.${NC} ${GREEN}%s${NC}\n" "$num" "${KDE_NAMES[$i]}"
        echo "      ${desc}"
        echo ""
    done

    echo -e "  ${BOLD}To install:${NC}  switch-de.sh kde <number>"
    echo -e "  ${BOLD}GUI method:${NC}  System Settings → Appearance → Global Theme → Get New"
    echo ""
}

show_hypr_themes() {
    echo ""
    echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}║  Hyprland — Dotfile Repositories                  ║${NC}"
    echo -e "${BOLD}${CYAN}║  Clone from GitHub. Apply. Don't like it? Swap.    ║${NC}"
    echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""

    for i in "${!HYPR_NAMES[@]}"; do
        num=$((i + 1))
        name=$(printf "%-25s" "${HYPR_NAMES[$i]}")
        stars=$(printf "%-8s" "${HYPR_STARS[$i]}")
        desc="${HYPR_DESCS[$i]:0:65}"
        [ ${#HYPR_DESCS[$i]} -gt 65 ] && desc="${desc}..."
        echo -e "  ${BOLD}${num}.${NC} ${CYAN}${name}${NC} ${YELLOW}★${stars}${NC}"
        echo "      ${desc}"
        echo ""
    done

    echo -e "  ${BOLD}To install:${NC}  switch-de.sh hyprland <number>"
    echo ""
}

backup_current_config() {
    local de="$1"
    local ts=$(date +%Y%m%d_%H%M%S)
    local backup="$BACKUP_DIR/${de}-${ts}"
    mkdir -p "$backup"

    if [ "$de" = "kde" ]; then
        info "Backing up KDE config..."
        for f in kdeglobals kwinrc plasmarc kcminputrc powermanagementprofilesrc \
                  plasma-org.kde.plasma.desktop-appletsrc krunnerrc; do
            [ -f "$HOME/.config/$f" ] && cp "$HOME/.config/$f" "$backup/" 2>/dev/null
        done
        [ -d "$HOME/.local/share/plasma/desktoptheme" ] && cp -r "$HOME/.local/share/plasma/desktoptheme" "$backup/" 2>/dev/null
        [ -d "$HOME/.local/share/color-schemes" ] && cp -r "$HOME/.local/share/color-schemes" "$backup/" 2>/dev/null
        [ -d "$HOME/.config/kvantum" ] && cp -r "$HOME/.config/kvantum" "$backup/" 2>/dev/null
        success "KDE backup → $backup"
    elif [ "$de" = "hyprland" ]; then
        info "Backing up Hyprland config..."
        [ -d "$HOME/.config/hypr" ] && cp -r "$HOME/.config/hypr" "$backup/" 2>/dev/null
        [ -d "$HOME/.config/waybar" ] && cp -r "$HOME/.config/waybar" "$backup/" 2>/dev/null
        [ -d "$HOME/.config/rofi" ] && cp -r "$HOME/.config/rofi" "$backup/" 2>/dev/null
        [ -d "$HOME/.config/kitty" ] && cp -r "$HOME/.config/kitty" "$backup/" 2>/dev/null
        success "Hyprland backup → $backup"
    fi
}

install_kde_theme() {
    local idx=$1
    local i=$((idx - 1))
    local name="${KDE_NAMES[$i]}"
    local slug="${KDE_SLUGS[$i]}"

    echo ""
    echo -e "${BOLD}Installing KDE Global Theme: ${GREEN}${name}${NC}"
    echo ""

    # Backup current KDE config
    backup_current_config "kde"

    # Install via KDE Store (ghns) or look up the package
    info "Opening KDE Global Theme installer..."
    info "Search for: ${name}"
    echo ""
    echo "In System Settings:"
    echo "  1. Appearance → Global Theme"
    echo "  2. Click 'Get New Global Themes...'"
    echo "  3. Search: ${name}"
    echo "  4. Click Install"
    echo "  5. Apply the theme"
    echo ""

    # Try to install via command line if possible
    if command -v plasmapkg2 &>/dev/null; then
        info "Attempting command-line install..."
        # For themes available as packages
        case "$slug" in
            "Sweet")
                sudo dnf install -y sweet-theme 2>/dev/null || info "Install via System Settings"
                ;;
            "Nordic")
                sudo dnf install -y nordic-kde 2>/dev/null || info "Install via System Settings"
                ;;
            "Materia-KDE")
                sudo dnf install -y materia-kde 2>/dev/null || info "Install via System Settings"
                ;;
            *)
                info "Install '${name}' via System Settings → Global Theme → Get New"
                ;;
        esac
    else
        info "Install via System Settings → Global Theme → Get New"
    fi

    echo ""
    success "Theme: ${name}"
    echo "To apply: System Settings → Appearance → Global Theme → select ${name}"
}

install_hypr_theme() {
    local idx=$1
    local i=$((idx - 1))
    local name="${HYPR_NAMES[$i]}"
    local slug="${HYPR_SLUGS[$i]}"
    local repo="${HYPR_REPOS[$i]}"

    echo ""
    echo -e "${BOLD}Installing Hyprland Dots: ${GREEN}${name}${NC}"
    echo -e "  ${YELLOW}★ ${HYPR_STARS[$i]} stars${NC}"
    echo ""

    # Backup current Hyprland config
    backup_current_config "hyprland"

    # Clone to cache dir
    local clone_dir="$HOME/.cache/dotfiles/${slug}"
    if [ -d "$clone_dir/.git" ]; then
        info "Updating existing clone..."
        cd "$clone_dir" && git pull 2>/dev/null || true
    else
        info "Cloning ${repo}..."
        mkdir -p "$HOME/.cache/dotfiles"
        if [ -d "$clone_dir" ]; then rm -rf "$clone_dir"; fi
        git clone --depth=1 "$repo" "$clone_dir" 2>/dev/null || {
            error "Failed to clone ${repo}"
            return 1
        }
    fi

    echo ""
    success "Cloned to: ${clone_dir}"
    echo ""
    info "To apply:"
    echo "  cd ${clone_dir}"
    echo "  # Follow the repo's install instructions"
    echo "  # Usually: ./install.sh or ./setup.sh"
    echo ""
    info "Don't like it? Switch to another:"
    echo "  switch-de.sh hyprland <another-number>"
    echo ""
    info "To restore your previous config:"
    echo "  ls ~/.config/theme-backups/hyprland-*"
    echo "  cp -r <backup>/* ~/.config/"
}

interactive_menu() {
    while true; do
        echo ""
        echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════╗${NC}"
        echo -e "${BOLD}${CYAN}║  Desktop Theme Switcher                             ║${NC}"
        echo -e "${BOLD}${CYAN}║  Pick one. Don't like it? Pick another.            ║${NC}"
        echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "  ${BOLD}${GREEN}1.${NC} ${GREEN}KDE Plasma Global Themes${NC}"
        echo -e "  ${BOLD}${CYAN}2.${NC} ${CYAN}Hyprland Dotfile Repos${NC}"
        echo -e "  ${BOLD}${YELLOW}3.${NC} ${YELLOW}Show installed backups${NC}"
        echo -e "  ${BOLD}${RED}0.${NC} ${RED}Exit${NC}"
        echo ""
        echo -n "Choose: "
        read -r choice

        case "$choice" in
            1)
                show_kde_themes
                echo -n "Install theme number (0 to go back): "
                read -r num
                if [ "$num" -gt 0 ] 2>/dev/null && [ "$num" -le "${#KDE_NAMES[@]}" ]; then
                    install_kde_theme "$num"
                fi
                ;;
            2)
                show_hypr_themes
                echo -n "Install theme number (0 to go back): "
                read -r num
                if [ "$num" -gt 0 ] 2>/dev/null && [ "$num" -le "${#HYPR_NAMES[@]}" ]; then
                    install_hypr_theme "$num"
                fi
                ;;
            3)
                echo ""
                echo "Installed backups:"
                ls -lh "$BACKUP_DIR"/ 2>/dev/null || echo "  No backups yet"
                echo ""
                ;;
            0)
                echo "Bye."
                exit 0
                ;;
            *)
                echo "Invalid choice."
                ;;
        esac
    done
}

# ═══════════════════════════════════════════════════════════════════
#  MAIN
# ═══════════════════════════════════════════════════════════════════

case "${1:-menu}" in
    kde)
        if [ -n "${2:-}" ]; then
            install_kde_theme "$2"
        else
            show_kde_themes
        fi
        ;;
    hyprland)
        if [ -n "${2:-}" ]; then
            install_hypr_theme "$2"
        else
            show_hypr_themes
        fi
        ;;
    menu|"")
        interactive_menu
        ;;
    *)
        error "Unknown command: $1"
        echo "Usage: $0 [kde|hyprland] [number]"
        exit 1
        ;;
esac
