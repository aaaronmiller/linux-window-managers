# Dotfile Compatibility Matrix

## Bar/Launcher/Lockscreen Stacks

| Repo | Bar | Launcher | Lockscreen | Color Engine | Terminal | Shell |
|------|-----|----------|------------|-------------|----------|-------|
| End-4 | Quickshell | Quickshell | Quickshell | matugen | foot (primary), kitty | Fish |
| Caelestia | Quickshell | Quickshell | Quickshell | smartScheme | foot | — |
| ML4W | Waybar | Rofi | Hyprlock | matugen | Kitty | Fish/Bash |
| HyDE | Waybar | Rofi | Hyprlock | wallust | Kitty | — |
| JaKooLit | Waybar | Rofi | Hyprlock | wallust | Kitty | — |
| snes19xx | Quickshell | Rofi | Hyprlock | Everforest GTK+Kvantum | Kitty | Zsh |
| Spelljinxer | Waybar | Rofi | Hyprlock | pywal | Kitty | Zsh/P10k |
| sh1zicus | Waybar+AGS | Rofi | Hyprlock | End-4 fork | Kitty | — |
| R7rainz | Quickshell | Rofi | Hyprlock | — | Kitty | — |

## Compatibility Groups

**GROUP 1 — Quickshell native (swap freely):**
- End-4 ↔ Caelestia
- Both use Quickshell for everything. Visual themes are JSON/QML.

**GROUP 2 — Standard stack (swap freely):**
- ML4W ↔ HyDE ↔ JaKooLit ↔ Spelljinxer
- All use Waybar + Rofi + Hyprlock. Color engines differ but configs are compatible.

**GROUP 3 — Hybrid (partial compatibility):**
- snes19xx ↔ R7rainz
- Quickshell bar but Rofi launcher + Hyprlock lockscreen.

## Terminal Theme Swapping (works across ALL groups)

Terminal configs are self-contained — just swap the color section:
- Kitty: 20-50 lines, easy to swap
- Foot: 15-30 lines, easy to swap
- Color source: matugen/wallust/pywal → writes to terminal config

## What's Actually Swappable

| Layer | Swappable? | Notes |
|-------|-----------|-------|
| Wallpaper | ✓ Always | User provides own |
| Terminal colors | ✓ Always | Self-contained |
| Terminal behavior | ⚠ Partial | Shell choice matters |
| Bar visual (CSS) | ⚠ Same stack only | Waybar CSS only works with Waybar |
| Bar config (modules) | ⚠ Same stack only | Waybar config ≠ Quickshell |
| Launcher theme | ⚠ Same app only | Rofi themes only work with Rofi |
| Lockscreen visual | ⚠ Same app only | Hyprlock only works with Hyprlock |
| Keybinds | ✓ Mostly | Hyprland keybinds are universal |
| Window rules | ✓ Mostly | Hyprland rules are universal |
| GTK theme | ✓ Always | System-wide |
| Qt/Kvantum | ✓ Always | System-wide |
| Fonts | ✓ Always | System-wide |
| Icons | ✓ Always | System-wide |
| GLSL shaders | ✓ Always | Hyprland-wide |

## Terminal vs GUI File Map

**Terminal Programs:**
- Kitty → kitty.conf (VISUAL: colors, font / CONFIG: shell, keybinds, padding)
- Foot → foot.ini (VISUAL: colors, font / CONFIG: shell, keybinds, scrollback)
- Ghostty → config (VISUAL: colors, font / CONFIG: keybinds, behavior)
- Neovim → init.lua (CONFIG only)
- Zsh/Bash/Fish → .zshrc/.bashrc/config.fish (CONFIG only)
- Starship → starship.toml (VISUAL: prompt theme)
- Ranger → rc.conf (CONFIG only)
- btop → btop.conf (VISUAL: theme + CONFIG: behavior)
- tmux → tmux.conf (CONFIG only)

**GUI Programs:**
- Waybar → config.jsonc + style.css (CONFIG modules + VISUAL CSS)
- Rofi → config.rasi + theme.rasi (CONFIG behavior + VISUAL theme)
- Hyprlock → hyprlock.conf (VISUAL layout + colors)
- Hyprland → hyprland.conf (CONFIG: keybinds, rules, plugins)
- Dunst → dunstrc (VISUAL: colors, layout + CONFIG: behavior)
- SwayNC → config.json + style.css (CONFIG modules + VISUAL CSS)
- GTK → settings.ini + gtk.css (VISUAL only)
- Kvantum → kvconfig (VISUAL only)
- SDDM → theme.conf + QML (VISUAL only)
