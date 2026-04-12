# Hand-Done Decomposition Notes — 5 Repos Analyzed

## KEY FINDINGS

### End-4/dots-hyprland (13,800★) — 1138 files, 8.7MB
**Type:** Full Hyprland + KDE desktop config
**Visual:** matugen wallpaper color extraction, kdeglobals, Kvantum, Breeze theme, Space Grotesk + JetBrains Mono fonts, darkly Qt theme
**Config:** Hyprland (env, variables, execs, general, rules, colors, keybinds — all modular), Quickshell bar, kitty + foot terminals, fuzzel launcher, hyprlock, swaylock, mpv, wlogout
**Terminal:** foot (primary), kitty (secondary) — both with matugen color sync
**Shell:** Fish (primary), Zsh (secondary)
**Install:** Arch-focused (PKGBUILDs), has Fedora/Gentoo/Nix support, massive install script with dependency checking
**Unique:** `dots-extra` dir for emacs/swaylock configs, `sdata/` has full distro detection, modular hyprland.conf with sources
**What's shared between configs:** matugen colors → kdeglobals, Quickshell, terminals, hyprlock. One color source, many consumers.

### ML4W OS (4,600★) — 536 files, 165MB
**Type:** Full Hyprland desktop with installer
**Visual:** matugen wallpaper extraction, GTK 3/4 CSS + settings, qt6ct, ohmyposh themes, rofi color themes, nwg-dock colors
**Config:** Hyprland (colors, hypridle, hyprland, hyprlock, hyprpaper, hyprsunset, monitors, workspaces), kitty terminal, rofi (6 configs!), waybar, btop, fastfetch, fish shell, chromium/edge flags
**Terminal:** Kitty (matugen-synced)
**Shell:** Fish, Bash
**Install:** `.dotinst` installer files, `setup` script, `share/` with wallpapers and packages
**Unique:** `ml4w/` custom scripts dir, version.json, listeners.sh, library.sh — custom app ecosystem
**What's shared:** matugen → kitty, GTK CSS, rofi, hyprlock, waybar. GTK 3 AND 4 both themed.

### Caelestia (8,900★) — 415 files, 3.4MB
**Type:** STANDALONE APPLICATION, not dotfiles. QML/C++ shell.
**Visual:** Built into the app — smartScheme, JSON config, light/dark modes, transparency, blur
**Config:** shell.json controls everything, NixOS home-manager module
**Terminal:** foot (configurable)
**Install:** AUR or Nix flake
**Key:** This is NOT a dotfile repo. It's an app that replaces waybar+lockscreen+notifications+launcher.

### DMS (5,600★) — 1264 files, 107MB
**Type:** STANDALONE APPLICATION, not dotfiles. Quickshell QML + Go backend.
**Visual:** Built into app — matugen color extraction, GTK/Qt sync, light/dark
**Config:** dms json config, replaces 6+ tools
**Install:** Multi-distro (Arch, Fedora, Debian, Ubuntu, openSUSE, Gentoo)
**Key:** Also NOT a dotfile repo. It's an app.

### snes19xx/surface-dots — 571 files, 958MB
**Type:** Full Hyprland + KDE desktop config, Surface-optimized
**Visual:** Everforest GTK+Kvantum, Papirus icons, Volantes cursors, Iosevka/Inter/Manrope fonts, 14 GLSL shaders, SDDM pixel theme, Surface ICC profile
**Config:** Quickshell (dual-mode), Rofi, Kitty, Hyprlock, waypaper, Dunst, Thunar, Firefox (custom start.html), Google Calendar sync
**Terminal:** Kitty (Everforest themed)
**Shell:** Zsh
**Install:** GUI installer (WebKitGTK), Arch-glibc tested
**Key:** Biggest repo (958MB) because it includes media, wallpapers, SDDM themes, fonts, utilities, venv. Deepest Everforest consistency.

## PATTERNS DISCOVERED

1. **Color source is always ONE place:** matugen, wallust, pywal, or smartScheme. Everything else references it.
2. **Terminal colors follow the color source:** Always synced via include or template
3. **Terminal configs are 80% behavior, 20% visual:** font, cursor, padding, shell, keybinds = behavior. colors = visual
4. **GUI configs are 70% visual, 30% behavior:** CSS, themes, icons = visual. modules, keybinds = behavior
5. **Keybinds are always in hyprland.conf** — shared across all themes in a repo
6. **Wallpaper is never bundled** (except snes19xx) — user provides their own
7. **Install scripts are distro-specific** — always the messiest part
8. **No repo separates visual from config** — everything is mixed together
9. **Terminal config is always a small file** — 20-50 lines. Easy to extract and swap.
10. **Font choices are consistent** — each repo picks 2-3 fonts and uses them everywhere

## WHAT GETS REPLACED WHEN YOU SWITCH
- ALWAYS: hyprland.conf (or equivalent), bar config, terminal colors, wallpaper
- SOMETIMES: terminal behavior config, shell config, keybinds
- NEVER: SSH keys, git config, browser data, installed packages, ~/Documents

## WHAT PERSISTS
- All installed packages (dotfiles don't uninstall)
- All user data
- All browser profiles
- All SSH/GPG keys
- All systemd services
