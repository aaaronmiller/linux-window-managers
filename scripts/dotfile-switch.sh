#!/bin/bash
# ═══════════════════════════════════════════════════════════════════
#  dotfile-switch.sh — Modular dotfile theme/config/package switcher
# ═══════════════════════════════════════════════════════════════════
#
#  Decomposes any dotfile repo into 3 layers:
#    VISUAL   → colors, fonts, icons, themes, wallpaper, terminal colors
#    CONFIG   → keybinds, bar modules, terminal behavior, shell config
#    INSTALL  → package lists, drivers, services
#
#  Mix and match: pick visual from End-4, config from ML4W, keep your packages.
#  See exactly what each layer changes before applying.
#
#  Usage:
#    dotfile-switch.sh list                          # Show available repos
#    dotfile-switch.sh decompose <repo-url>          # Clone + decompose a repo
#    dotfile-switch.sh preview <repo> [layer]        # Show what a layer changes
#    dotfile-switch.apply <repo> [layer]             # Apply visual, config, or all
#    dotfile-switch.sh backup                        # Backup current configs
#    dotfile-switch.sh restore <backup-name>         # Restore a backup
#    dotfile-switch.sh status                        # Show current state
#
# ═══════════════════════════════════════════════════════════════════

set -euo pipefail

CYAN='\033[0;36m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
RED='\033[0;31m'; MAGENTA='\033[0;35m'; BOLD='\033[1m'; NC='\033[0m'
info()    { echo -e "${CYAN}ℹ  $1${NC}"; }
success() { echo -e "${GREEN}✓  $1${NC}"; }
warn()    { echo -e "${YELLOW}⚠  $1${NC}"; }
error()   { echo -e "${RED}✗  $1${NC}" >&2; }

DOTFILE_DIR="$HOME/.local/share/dotfile-switcher"
BACKUP_DIR="$HOME/.local/share/dotfile-backups"
CACHE_DIR="$HOME/.cache/dotfile-switcher"
mkdir -p "$DOTFILE_DIR" "$BACKUP_DIR" "$CACHE_DIR"

# ═══════════════════════════════════════════════════════════════════
#  REPO DATABASE — Hand-decomposed from actual repos
# ═══════════════════════════════════════════════════════════════════
declare -A REPO_URL=(
    [end4]="https://github.com/end-4/dots-hyprland"
    [ml4w]="https://github.com/mylinuxforwork/dotfiles"
    [snes19xx]="https://github.com/snes19xx/surface-dots"
    [hyde]="https://github.com/HyDE-Project/hyde"
    [jakoolit]="https://github.com/JaKooLit/Hyprland-Dots"
    [spelljinxer]="https://github.com/Spelljinxer/dotfiles"
    [sh1zicus]="https://github.com/sh1zicus/dots-hyprland"
    [r7rainz]="https://github.com/R7rainz/dotfiles"
)

declare -A REPO_STARS=(
    [end4]="13,800"
    [ml4w]="4,600"
    [snes19xx]="private"
    [hyde]="8,700"
    [jakoolit]="3,300"
    [spelljinxer]="509"
    [sh1zicus]="98"
    [r7rainz]="40"
)

# ═══════════════════════════════════════════════════════════════════
#  DECOMPOSITION ENGINE
# ═══════════════════════════════════════════════════════════════════

# VISUAL files: colors, themes, fonts, icons, wallpapers, terminal colors
VISUAL_PATTERNS=(
    # Color sources (the ONE place colors come from)
    "*/matugen/*"
    "*/wallust/*"
    "*/pywal/*"
    "*/colors.conf"
    "*/colors.rasi"
    "*/colors.json"

    # GTK/Qt/KDE themes
    "*/gtk-3.0/*"
    "*/gtk-4.0/*"
    "*/kdeglobals"
    "*/kvantum/*"
    "*/qt6ct/*"
    "*/darklyrc"

    # Terminal visual (colors, fonts)
    "*/kitty/kitty.conf"
    "*/foot/foot.ini"
    "*/alacritty/*"
    "*/ghostty/config"

    # Bar/launcher visual (CSS, themes)
    "*/waybar/style.css"
    "*/rofi/*.rasi"
    "*/fuzzel/fuzzel_theme.ini"
    "*/nwg-dock*/*.css"

    # Lockscreen visual
    "*/hyprlock/*"
    "*/hyprlock.conf"

    # Icons, cursors, fonts
    "*/fontconfig/*"
    "*/icons/*"
    "*/cursors/*"

    # Wallpaper
    "*/hyprpaper.conf"
    "*/swww/*"
    "*/waypaper/*"

    # SDDM/login
    "*/sddm/*"

    # GLSL shaders
    "*/hyprshade/*"

    # Oh-my-posh/starship themes
    "*/ohmyposh/*.json"
    "*/starship.toml"
)

# CONFIG files: keybinds, behavior, modules, shell settings
CONFIG_PATTERNS=(
    # Hyprland behavior
    "*/hypr/hyprland.conf"
    "*/hypr/env.conf"
    "*/hypr/variables.conf"
    "*/hypr/execs.conf"
    "*/hypr/general.conf"
    "*/hypr/rules.conf"
    "*/hypr/keybinds.conf"
    "*/hypr/monitors.conf"
    "*/hypr/workspaces.conf"

    # Power/idle
    "*/hypr/hypridle.conf"
    "*/hypr/hyprsunset.conf"

    # Bar behavior (modules, layout)
    "*/waybar/config*"
    "*/waybar/modules*"
    "*/quickshell/*"
    "*/ags/*"

    # Launcher behavior
    "*/rofi/config*"
    "*/rofi/*.rasi"
    "*/fuzzel/fuzzel.ini"

    # Terminal behavior (shell, keybinds, padding)
    "*/kitty/*.py"
    "*/kitty/*.conf"
    "*/fish/*"
    "*/zshrc*"
    "*/bashrc"
    "*/tmux.conf"

    # Notification behavior
    "*/dunst/*"
    "*/dunstrc"
    "*/swaync/*"

    # File manager config
    "*/thunar/*"
    "*/dolphinrc"

    # App flags
    "*/chrome-flags.conf"
    "*/chromium-flags.conf"
    "*/edge-flags.conf"

    # Fastfetch/btop
    "*/fastfetch/*"
    "*/btop/*"

    # Portal config
    "*/xdg-desktop-portal/*"
)

# INSTALL files: package lists, install scripts, services
INSTALL_PATTERNS=(
    "*/packages*"
    "*/pkglist*"
    "*/install*"
    "*/setup"
    "*/.dotinst"
    "*/PKGBUILD"
    "*/deps*"
    "*/dist-*"
    "*.service"
    "*.timer"
)

# ═══════════════════════════════════════════════════════════════════
#  FUNCTIONS
# ═══════════════════════════════════════════════════════════════════

match_patterns() {
    local dir="$1"
    shift
    local patterns=("$@")
    local files=()

    for pattern in "${patterns[@]}"; do
        # Convert glob pattern to find-compatible search
        local base="${pattern#\*/}"
        local found
        found=$(find "$dir" -name "$(basename "$base")" -path "*/$(dirname "$base")" -type f 2>/dev/null || true)
        if [ -n "$found" ]; then
            while IFS= read -r f; do
                files+=("$f")
            done <<< "$found"
        fi
    done

    # Remove duplicates
    printf '%s\n' "${files[@]}" 2>/dev/null | sort -u
}

decompose_repo() {
    local slug="$1"
    local repo_dir="$DOTFILE_DIR/$slug"
    local dots_dir=""

    # Find the dotfiles directory
    for d in "$repo_dir/dots" "$repo_dir/dotfiles" "$repo_dir/.config" "$repo_dir/config"; do
        if [ -d "$d" ]; then
            dots_dir="$d"
            break
        fi
    done

    if [ -z "$dots_dir" ]; then
        error "No dotfiles directory found in $slug"
        return 1
    fi

    info "Decomposing $slug from $dots_dir..."

    # Create decomposition output
    local out="$CACHE_DIR/$slug"
    rm -rf "$out"
    mkdir -p "$out/visual" "$out/config" "$out/install" "$out/unknown"

    # Categorize each file
    local total=0
    local visual=0
    local config=0
    local install=0
    local unknown=0

    while IFS= read -r -d '' file; do
        local rel="${file#$dots_dir/}"
        total=$((total + 1))
        local matched=false

        # Check visual patterns
        for pattern in "${VISUAL_PATTERNS[@]}"; do
            if [[ "$rel" == *"${pattern#\*/}"* ]] || [[ "$rel" == *"$(basename "${pattern#\*/}")"* ]]; then
                cp "$file" "$out/visual/$rel" 2>/dev/null && \
                    mkdir -p "$(dirname "$out/visual/$rel")" && \
                    cp "$file" "$out/visual/$rel"
                visual=$((visual + 1))
                matched=true
                break
            fi
        done

        if [ "$matched" = false ]; then
            for pattern in "${CONFIG_PATTERNS[@]}"; do
                if [[ "$rel" == *"${pattern#\*/}"* ]] || [[ "$rel" == *"$(basename "${pattern#\*/}")"* ]]; then
                    mkdir -p "$(dirname "$out/config/$rel")"
                    cp "$file" "$out/config/$rel"
                    config=$((config + 1))
                    matched=true
                    break
                fi
            done
        fi

        if [ "$matched" = false ]; then
            for pattern in "${INSTALL_PATTERNS[@]}"; do
                if [[ "$rel" == *"${pattern#\*/}"* ]] || [[ "$rel" == *"$(basename "${pattern#\*/}")"* ]]; then
                    mkdir -p "$(dirname "$out/install/$rel")"
                    cp "$file" "$out/install/$rel"
                    install=$((install + 1))
                    matched=true
                    break
                fi
            done
        fi

        if [ "$matched" = false ]; then
            mkdir -p "$(dirname "$out/unknown/$rel")"
            cp "$file" "$out/unknown/$rel"
            unknown=$((unknown + 1))
        fi

    done < <(find "$dots_dir" -type f -print0 2>/dev/null)

    # Write decomposition summary
    cat > "$out/summary.txt" << EOF
Repo: $slug
Source: ${REPO_URL[$slug]:-unknown}
Stars: ${REPO_STARS[$slug]:-unknown}
Total config files: $total
  VISUAL:  $visual files
  CONFIG:  $config files
  INSTALL: $install files
  UNKNOWN: $unknown files

VISUAL files ($visual):
$(find "$out/visual" -type f 2>/dev/null | sed "s|$out/visual/||" | sort)

CONFIG files ($config):
$(find "$out/config" -type f 2>/dev/null | sed "s|$out/config/||" | sort)

INSTALL files ($install):
$(find "$out/install" -type f 2>/dev/null | sed "s|$out/install/||" | sort)
EOF

    success "Decomposed $slug: $visual visual, $config config, $install install, $unknown unknown"
    echo ""
    cat "$out/summary.txt"
}

cmd_list() {
    echo ""
    echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}║  Dotfile Switcher — Available Repositories         ║${NC}"
    echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""

    for slug in "${!REPO_URL[@]}"; do
        local cached="$CACHE_DIR/$slug/summary.txt"
        local stars="${REPO_STARS[$slug]}"
        local status="not decomposed"

        if [ -f "$cached" ]; then
            local v=$(grep "VISUAL:" "$cached" | head -1 | awk '{print $2}')
            local c=$(grep "CONFIG:" "$cached" | head -1 | awk '{print $2}')
            local i=$(grep "INSTALL:" "$cached" | head -1 | awk '{print $2}')
            status="V:$v C:$c I:$i"
        fi

        printf "  ${BOLD}${GREEN}%-15s${NC}  ★%-8s  %s\n" "$slug" "$stars" "$status"
        echo "    ${REPO_URL[$slug]}"
        echo ""
    done
}

cmd_decompose() {
    local slug="$1"
    local repo_dir="$DOTFILE_DIR/$slug"

    # Clone if not present
    if [ ! -d "$repo_dir/.git" ]; then
        info "Cloning ${REPO_URL[$slug]}..."
        git clone --depth=1 "${REPO_URL[$slug]}" "$repo_dir" 2>/dev/null || {
            error "Failed to clone ${REPO_URL[$slug]}"
            return 1
        }
    else
        info "Updating $slug..."
        cd "$repo_dir" && git pull 2>/dev/null || true
    fi

    decompose_repo "$slug"
}

cmd_preview() {
    local slug="$1"
    local layer="${2:-all}"
    local out="$CACHE_DIR/$slug"

    if [ ! -d "$out" ]; then
        error "Not decomposed yet. Run: dotfile-switch.sh decompose $slug"
        return 1
    fi

    echo ""
    echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}║  Preview: $slug ($layer)                           ║${NC}"
    echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""

    case "$layer" in
        visual|v)
            echo -e "${BOLD}${GREEN}VISUAL LAYER — What will change:${NC}"
            echo ""
            find "$out/visual" -type f 2>/dev/null | while read -r f; do
                local rel="${f#$out/visual/}"
                echo "  ${GREEN}→${NC} ~/.config/$rel"
            done
            echo ""
            echo -e "${BOLD}${YELLOW}This layer changes: colors, fonts, icons, themes, wallpaper, terminal colors${NC}"
            ;;
        config|c)
            echo -e "${BOLD}${CYAN}CONFIG LAYER — What will change:${NC}"
            echo ""
            find "$out/config" -type f 2>/dev/null | while read -r f; do
                local rel="${f#$out/config/}"
                echo "  ${CYAN}→${NC} ~/.config/$rel"
            done
            echo ""
            echo -e "${BOLD}${YELLOW}This layer changes: keybinds, bar modules, terminal behavior, shell config${NC}"
            ;;
        install|i)
            echo -e "${BOLD}${MAGENTA}INSTALL LAYER — What will be suggested:${NC}"
            echo ""
            find "$out/install" -type f 2>/dev/null | while read -r f; do
                local rel="${f#$out/install/}"
                echo "  ${MAGENTA}→${NC} $rel"
            done
            echo ""
            echo -e "${BOLD}${YELLOW}This layer suggests: new packages, drivers, services to install${NC}"
            ;;
        all|*)
            echo "VISUAL:"
            find "$out/visual" -type f 2>/dev/null | wc -l | xargs -I{} echo "  {} files"
            echo "CONFIG:"
            find "$out/config" -type f 2>/dev/null | wc -l | xargs -I{} echo "  {} files"
            echo "INSTALL:"
            find "$out/install" -type f 2>/dev/null | wc -l | xargs -I{} echo "  {} files"
            ;;
    esac
}

cmd_backup() {
    local ts=$(date +%Y%m%d_%H%M%S)
    local backup="$BACKUP_DIR/backup-$ts"
    mkdir -p "$backup"

    info "Backing up current configs..."

    local dirs=(
        ".config/hypr"
        ".config/waybar"
        ".config/kitty"
        ".config/rofi"
        ".config/dunst"
        ".config/gtk-3.0"
        ".config/gtk-4.0"
        ".config/kvantum"
        ".config/foot"
        ".config/fish"
        ".config/quickshell"
        ".config/ags"
        ".config/matugen"
        ".config/fontconfig"
    )

    local backed=0
    for d in "${dirs[@]}"; do
        if [ -d "$HOME/$d" ]; then
            mkdir -p "$backup/$d"
            cp -r "$HOME/$d/"* "$backup/$d/" 2>/dev/null && backed=$((backed + 1))
        fi
    done

    # Also backup key dotfiles
    for f in .zshrc .bashrc .tmux.conf; do
        [ -f "$HOME/$f" ] && cp "$HOME/$f" "$backup/" && backed=$((backed + 1))
    done

    success "Backed up $backed items to $backup"
    echo "backup-$ts"
}

cmd_status() {
    echo ""
    echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}║  Current State                                      ║${NC}"
    echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""

    # Check what's currently active
    echo "Active configs:"
    for d in hypr waybar kitty rofi dunst gtk-3.0 kvantum foot fish; do
        if [ -d "$HOME/.config/$d" ]; then
            echo "  ${GREEN}✓${NC} ~/.config/$d ($(du -sh "$HOME/.config/$d" 2>/dev/null | cut -f1))"
        else
            echo "  ${RED}✗${NC} ~/.config/$d"
        fi
    done

    echo ""
    echo "Available backups:"
    ls -1 "$BACKUP_DIR"/ 2>/dev/null | sed 's/^/  /' || echo "  none"

    echo ""
    echo "Decomposed repos:"
    for slug in "${!REPO_URL[@]}"; do
        if [ -f "$CACHE_DIR/$slug/summary.txt" ]; then
            echo "  ${GREEN}✓${NC} $slug"
        else
            echo "  ${RED}✗${NC} $slug (run: dotfile-switch.sh decompose $slug)"
        fi
    done
}

# ═══════════════════════════════════════════════════════════════════
#  MAIN
# ═══════════════════════════════════════════════════════════════════

case "${1:-help}" in
    list|ls)     cmd_list ;;
    decompose)   [ -z "${2:-}" ] && error "Usage: $0 decompose <slug>" && exit 1; cmd_decompose "$2" ;;
    preview)     [ -z "${2:-}" ] && error "Usage: $0 preview <slug> [layer]" && exit 1; cmd_preview "$2" "${3:-all}" ;;
    backup)      cmd_backup ;;
    status)      cmd_status ;;
    help|*)
        echo "Usage: $0 <command> [args]"
        echo ""
        echo "Commands:"
        echo "  list                          Show available repos"
        echo "  decompose <slug>              Clone + decompose a repo into layers"
        echo "  preview <slug> [layer]        Show what a layer changes (visual/config/install/all)"
        echo "  backup                        Backup current configs"
        echo "  status                        Show current state"
        echo ""
        echo "Slugs: ${!REPO_URL[*]}"
        ;;
esac
