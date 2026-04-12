# Full Dotfile Decomposition — 10 Repos Hand-Analyzed

> Generated: April 11, 2026
> Method: Cloned each repo, walked file tree by hand, examined key config files

---

## 1. End-4/dots-hyprland (13,800★) — 1,138 files, 8.7MB

**Stack:** Quickshell (bar + launcher + lockscreen + notifications + sidebar + AI + calendar + weather)
**Terminal:** foot (primary), kitty (secondary)
**Shell:** Fish
**Color Engine:** matugen

### VISUAL (22 core files)
- matugen/config.toml + templates (GTK CSS, hyprlock colors, KDE colors, wallpaper.txt)
- kdeglobals (KDE color scheme)
- Kvantum/kvantum.kvconfig
- darklyrc (Qt theme)
- fontconfig/fonts.conf
- hypr/hyprlock/colors.conf
- hypr/hyprland/colors.conf
- starship.toml
- foot/foot.ini (colors + font)
- wlogout/style.css
- Quickshell icon assets (300+ SVG icons — Fluent UI style)
- local/share/icons/illogical-impulse.svg

### CONFIG (~650 files)
- Hyprland: env.conf, variables.conf, execs.conf, general.conf, rules.conf, colors.conf, keybinds.conf, monitors.conf, workspaces.conf — all modular with custom/ overrides
- Quickshell: 600+ QML files — bar, lock, notifications, launcher, sidebar (AI chat, anime booru, translator), overlays, calendar, weather, media controls, screen snip, recording, on-screen keyboard, polkit, session screen, task view, settings
- Fish: config.fish, auto-Hypr.fish, fish_variables
- Zsh: auto-Hypr.sh, dots-hyprland.zsh, shortcuts.zsh
- Hyprlock: hyprlock.conf + colors.conf + check-capslock.sh + status.sh
- mpv/mpv.conf
- dolphinrc
- browser flags (chrome, code, thorium)

### INSTALL (in sdata/)
- Arch: PKGBUILDs with meta packages (illogical-impulse-audio, backlight, basic, fonts-themes, etc.)
- Fedora/Gentoo/Nix distro files
- Setup script with dependency checking, distro detection
- ~50 packages organized in meta groups

**Key Finding:** Quickshell IS the desktop. Not a config file — a 600-file application. You can't swap End-4's visual layer onto a Waybar stack.

---

## 2. ML4W OS (4,600★) — 536 files, 165MB

**Stack:** Waybar + Rofi + Hyprlock (standard)
**Terminal:** Kitty
**Shell:** Fish, Bash
**Color Engine:** matugen

### VISUAL (18 files)
- matugen/config.toml
- GTK 3/4: colors.css + gtk.css + settings.ini (both versions)
- qt6ct/qt6ct.conf
- ohmyposh: colors.json, zen.toml, zen.toml.bak
- rofi: colors.rasi + theme variants
- nwg-dock-hyprland: colors.css, launch.sh
- hypr/colors.conf

### CONFIG (~80 files)
- Hyprland: colors.conf, hypridle.conf, hyprland.conf, hyprlock.conf, hyprpaper.conf, hyprsunset.conf, monitors.conf, workspaces.conf
- Kitty: kitty.conf
- fastfetch: config.jsonc
- fish: config.fish, fish_variables
- bashrc: 00-init, 10-aliases, 20-customization, 30-autostart (modular)
- btop/btop.conf
- ml4w/library.sh, listeners.sh, version.json (custom app ecosystem)
- Xresources

### INSTALL
- .dotinst installer files
- setup script
- share/ wallpapers + packages
- lib/ helper scripts

**Key Finding:** Most production-ready. Live ISO for testing. One-command disk install. 3 distro support. Custom ml4w/ scripts dir with version tracking.

---

## 3. snes19xx/surface-dots — 571 files, 958MB

**Stack:** Quickshell (bar) + Rofi (launcher) + Hyprlock (hybrid)
**Terminal:** Kitty
**Shell:** Zsh
**Color Engine:** Everforest (static, not dynamic)

### VISUAL (deepest consistency — everything matches)
- Everforest GTK (Fausto-Korpsvart base, modified)
- Kvantum theme + qt6ct config
- Papirus icons, Volantes cursors
- Iosevka Nerd Font Mono, Inter, Manrope fonts
- 14 GLSL shaders: reading_mode, night, outdoor, cinema, IBM 3278, IBM 5151, CRT, VHS, GameBoy, Fuji Acros, Night Vision, Focus, main
- SDDM "pixel" theme (from mahaveergurjar)
- Surface Laptop 4 ICC color profile
- Firefox: custom start.html (procedural sky/weather/lunar), userChrome.css, autoconfig.js, mozilla.cfg
- Kitty: Everforest color scheme
- Quickshell: dual-mode theming (top-bar vs taskbar)

### CONFIG
- Quickshell: dual-mode bar, snes-hub control center, Quickshell Drawer (Windows 10-style launcher)
- Rofi: config + theme
- Hyprland + Hyprlock
- waypaper (wallpaper manager)
- Dunst: auto-collapse with media
- Google Calendar: vdirsyncer + khal (Google CalDAV API + OAuth)
- Thunar config

### INSTALL
- GUI installer (WebKitGTK + polkit required)
- Includes: fonts, wallpapers, SDDM themes, media, utilities, Python venv
- Arch-glibc tested
- .source_codes/ (custom scripts: crt_gen.py, figures.py)

**Key Finding:** Biggest repo (958MB) because it includes everything — fonts, wallpapers, SDDM, media, utilities, venv. Deepest Everforest consistency. Only one with Surface hardware fixes, GLSL shaders, Calendar sync, and Firefox customization.

---

## 4. HyDE (8,700★) — 235+ config files

**Stack:** Waybar + Rofi + Hyprlock (standard)
**Terminal:** Kitty
**Shell:** Fish
**Color Engine:** wallust

### VISUAL
- wallust templates: cava.dcol, chrome.dcol, discord.dcol, spotify.dcol, vim.dcol
- Kvantum: wallbash.kvconfig + wallbash.svg (dynamic theme)
- GTK 3: settings.ini
- hyprland/animations/ — 20+ animation presets (LimeFrenzy, classic, diablo-1, diablo-2, dynamic, end4, fast, minimal, optimized, standard, theme, vertical)

### CONFIG
- Hyprland: animations.conf + individual animation files
- fish: config.fish, hyde.fish, hyde-shell.fish, user.fish, fzf functions (ffcd, ffch, ffe, ffec)
- fastfetch: multiple logos (agk_clan, aisaka, geass, hyprland, loli, pochita, ryuzaki)
- Code/VSCodium settings.json
- MangoHud.conf
- electron-flags.conf, code-flags.conf, codium-flags.conf
- baloofilerc, dolphinrc
- dunst: dunst.conf + dunstrc
- hyde/config.toml (central config)

### INSTALL
- Scripts: install.sh, install_aur.sh, install_pkg.sh, install_pre.sh, install_pst.sh
- Scripts/extra: custom_flat.lst, drivext_mnt.sh, install_fpk.sh, install_mod.sh, restore_app.sh, restore_lnk.sh
- Scripts/hydevm: HyDE VM for testing (NixOS + Arch)
- Scripts/nvidia-db: NVIDIA driver database
- Scripts/migrations: version migrations (v25.8.2.sh, v25.9.1.sh)
- chaotic_aur.sh (Chaotic AUR support)

**Key Finding:** Most animation presets (20+). Most comprehensive install scripts. VM for risk-free testing. NVIDIA driver database. Migration system for version updates. wallust engine syncs colors to 5+ apps (cava, Chrome, Discord, Spotify, Vim).

---

## 5. JaKooLit (3,300★) — Uses AGS instead of Quickshell

**Stack:** Waybar + AGS (Aylur's GTK Shell) + Rofi + Hyprlock
**Terminal:** Kitty + Ghostty
**Shell:** —
**Color Engine:** wallust

### VISUAL
- Kvantum: catppuccin-latte-blue + catppuccin-mocha-blue (dual theme)
- kvantum.kvconfig
- btop: 4 Catppuccin themes (frappe, latte, macchiato, mocha)
- cava: config + shaders (bar_spectrum, normalized_bars, northern_lights, pass_through)
- fastfetch: 4 configs (compact, pokemon, v2, default)
- ghostty/ghostty.config (supports Ghostty!)

### CONFIG
- AGS: config.js + modules (.configuration/user_options.js, .miscutils/icons.js/mathfuncs.js/system.js, .widgethacks/advancedrevealers.js/popupwindow.js, .widgetutils/clickthrough.js/cursorhover.js/keybind.js, overview/actions.js/main.js/miscfunctions.js/overview_hyprland.js/searchbuttons.js/searchitem.js/windowcontent.js)
- AGS user style.css, user_options.js, variables.js
- Wallpapers directory included

### INSTALL
- Distro-Hyprland.sh (multi-distro installer)
- copy.sh, update-dots.sh
- archive/ (old configs)
- i18n/ (Spanish translations)

**Key Finding:** Only one that supports Ghostty terminal. Uses AGS (JavaScript-based) instead of Quickshell (QML-based). Catppuccin-first theming. Has Spanish translations.

---

## 6. Spelljinxer/Bocchi (509★) — 274 config files

**Stack:** Waybar + Rofi + Hyprlock (standard)
**Terminal:** Kitty
**Shell:** Zsh + Powerlevel10k
**Color Engine:** pywal

### VISUAL
- pywal color extraction (dynamic from wallpaper)
- btop: multiple themes (HotPurpleTrafficLight, adapta, adwaita, ayu, catppuccin_*)
- sddm-flower-theme (modified)
- pywal-synced: kitty, waybar, rofi, hyprlock

### CONFIG
- .zshrc + .p10k.zsh (Powerlevel10k prompt)
- Kitty: pywal-synced colors
- Waybar: pywal-synced
- Rofi: pywal-synced
- Hyprlock: pywal-synced
- Ranger: TUI file manager config
- Neovim: NvChad distribution
- ncspot: Spotify TUI config
- cava: audio visualizer
- sptlrx: lyrics sync
- tomato-c: Pomodoro timer
- cbonsai, colorscripts, asciiquarium (terminal ambiance)
- fish config

### INSTALL
- Clone + manual
- Arch only
- pywal for color sync

**Key Finding:** Most "fun" repo. Terminal ambiance (asciiquarium, cbonsai, colorscripts). Spotify TUI + lyrics sync. Pomodoro timer. pywal-synced everything. Bocchi the Rock! anime theme.

---

## 7. DMS (5,600★) — STANDALONE APPLICATION

**Stack:** Quickshell QML + Go backend (replaces 6+ tools)
**Terminal:** User's choice
**Shell:** —
**Color Engine:** matugen + dank16

### VISUAL
- Built into the app — matugen color extraction
- GTK/Qt/terminal/VS Code auto-sync
- Light/Dark modes

### CONFIG
- dms json config
- Replaces: waybar, swaylock, swayidle, mako, fuzzel, polkit
- dsearch: Spotlight-style launcher (apps, files, emojis, windows, calc, CLI, plugins)
- Quickshell lockscreen (separate AC/battery profiles)
- Quickshell notifications (smart grouping, rich text, keyboard nav)
- Control center: network, BT, audio, display, night mode, calendar, weather, clipboard with image previews
- MPRIS media integration
- System monitor: CPU/RAM/GPU via dgop + searchable process manager

### INSTALL
- One-command across 6 distros (Arch, Fedora, Debian, Ubuntu, openSUSE, Gentoo)
- NixOS & home-manager module
- MIT Licensed
- Compositor-agnostic (Hyprland, niri, Sway, MangoWC, labwc, Scroll, MiracleWM)

**Key Finding:** NOT a dotfile repo. It's a standalone application. Monolithic architecture — one binary replaces 6+ tools. Compositor-agnostic.

---

## 8. Caelestia (8,900★) — STANDALONE APPLICATION

**Stack:** Quickshell QML/C++ shell
**Terminal:** foot
**Shell:** —
**Color Engine:** smartScheme (JSON config)

### VISUAL
- Built into the app — smartScheme auto-extracts from wallpaper
- Light/Dark mode toggles
- Transparency: base 0.85, layer 0.4, optional blur
- Material Symbols Rounded icons
- Rubik (UI), CaskaydiaCove NF (mono) fonts
- JSON-driven scaling: padding, border rounding (25), spacing, animation durations

### CONFIG
- shell.json controls everything
- NixOS home-manager module
- CLI: `caelestia shell ...` for MPRIS, wallpapers, drawers, lock, popouts
- Built-in wallpaper manager
- Animated session states (kurukuru.gif, bongocat.gif)
- Advanced hover popouts

### INSTALL
- AUR: caelestia-meta
- Nix flake

**Key Finding:** NOT a dotfile repo. It's a QML/C++ application. JSON-only config — no code edits needed. 8.9k stars. Reddit favorite.

---

## 9. R7rainz/Noctalia (40★)

**Stack:** Quickshell (Noctalia Shell) + Rofi + Hyprlock
**Terminal:** Kitty
**Shell:** —
**Color Engine:** —

### VISUAL
- Dark/black aesthetic
- Custom SDDM theme
- No bundled wallpaper

### CONFIG
- Noctalia Shell (custom Quickshell-based desktop shell)
- Rofi
- Kitty
- Hyprlock
- swww (wallpaper)
- Dunst/SwayNC (notifications)
- Neovim

### INSTALL
- Manual clone

**Key Finding:** Minimal but polished. Noctalia Shell is unique. 40 stars.

---

## 10. sh1zicus (98★)

**Stack:** Waybar + AGS + Rofi + Hyprlock
**Terminal:** Kitty
**Shell:** —
**Color Engine:** End-4 fork base

### VISUAL
- Material Design 3 palette
- Custom AGS modules styling

### CONFIG
- End-4 fork base + custom AGS modules
- Waybar + AGS
- Rofi
- Kitty
- Hyprlock
- swww
- Dunst

### INSTALL
- Guided transparent installer for Arch

**Key Finding:** End-4 fork with AGS instead of Quickshell. 98 stars.

---

## Updated Compatibility Matrix

| Group | Members | Bar | Launcher | Lockscreen | Color Engine | Terminal | Shell |
|-------|---------|-----|----------|------------|-------------|----------|-------|
| **Quickshell app** | End-4, Caelestia, DMS | Quickshell/DMS | Quickshell/DMS | Quickshell/DMS | matugen/smartScheme | foot | Fish/— |
| **Standard stack** | ML4W, HyDE, JaKooLit, Spelljinxer | Waybar | Rofi | Hyprlock | matugen/wallust/pywal | Kitty | Fish/Zsh |
| **Hybrid** | snes19xx, R7rainz | Quickshell | Rofi | Hyprlock | Everforest/— | Kitty | Zsh/— |
| **AGS-based** | sh1zicus | Waybar+AGS | Rofi | Hyprlock | End-4 fork | Kitty | — |

## Key New Discoveries

1. **JaKooLit supports Ghostty** — only repo with ghostty.config included
2. **HyDE has 20+ animation presets** — most customization of window animations
3. **HyDE has VM testing** — HyDEVM for risk-free tweaking
4. **HyDE has NVIDIA driver database** — auto-detects correct driver
5. **HyDE has migration system** — version updates with rollback
6. **snes19xx includes 14 GLSL shaders** — e-ink, CRT, VHS, GameBoy, etc.
7. **snes19xx includes Firefox customization** — procedural sky new-tab
8. **snes19xx includes Google Calendar sync** — vdirsyncer + khal
9. **Spelljinxer has terminal ambiance** — asciiquarium, cbonsai, colorscripts
10. **Spelljinxer has Spotify TUI + lyrics** — ncspot + sptlrx
11. **DMS and Caelestia are applications, not dotfiles** — they replace tools, not config them
12. **End-4 Quickshell is 600+ QML files** — it IS the desktop, not a config layer
13. **ML4W is most production-ready** — Live ISO, disk install, 3 distros
14. **HyDE is most feature-complete for Standard stack** — animations, VM, NVIDIA, migrations

## What Persists vs. What Changes (Updated)

### ALWAYS PERSISTS (never touched by any dotfile package)
- User data (Documents, Downloads, Pictures)
- Browser bookmarks/history/passwords
- SSH keys, GPG keys
- Git global config
- ~/.local/share/applications (custom .desktop files)
- ~/.local/share/keyrings (passwords)
- System packages (installed programs stay installed)
- /etc/ configs (system-wide settings)
- ~/.zshrc (rarely replaced — even Spelljinxer puts it in .config/.zshrc)
- ~/.bashrc (rarely replaced — ML4W uses modular bashrc.d/)

### SOMETIMES CHANGES
- ~/.config/hypr/ — usually replaced
- ~/.config/kitty/ — sometimes replaced (JaKooLit includes ghostty too)
- ~/.config/waybar/ — replaced in Standard stack, N/A in Quickshell
- ~/.config/rofi/ — sometimes replaced
- ~/.config/dunst/ — sometimes replaced
- ~/.config/gtk-3.0/ — sometimes replaced
- ~/.config/kvantum/ — sometimes replaced
- ~/.local/share/nemo-python/ — never touched

### USUALLY REPLACED (core dotfile content)
- hyprland.conf (or equivalent)
- bar config + CSS
- rofi theme
- kitty colors
- hyprlock.conf
- wallpaper
- dunstrc

## Terminal vs GUI File Map (Updated)

### TERMINAL Programs & Configs
| Program | Config File | Layer | Notes |
|---------|------------|-------|-------|
| **Kitty** | kitty.conf | VISUAL (colors, font) + CONFIG (keybinds, shell) | Universal across 8/10 repos |
| **foot** | foot.ini | VISUAL + CONFIG | End-4 primary, Caelestia only |
| **Ghostty** | config | VISUAL + CONFIG | Only JaKooLit includes it |
| **Neovim** | init.lua (NvChad) | CONFIG | Only Spelljinxer |
| **Zsh** | .zshrc + .p10k.zsh | CONFIG | snes19xx, Spelljinxer |
| **Fish** | config.fish | CONFIG | End-4, ML4W, HyDE |
| **Starship** | starship.toml | VISUAL (prompt theme) | End-4 |
| **btop** | btop.conf + themes | VISUAL (theme) + CONFIG (behavior) | ML4W, JaKooLit, Spelljinxer |
| **tmux** | tmux.conf | CONFIG | Not bundled by any repo |
| **cava** | config + shaders | VISUAL (audio visualizer) | JaKooLit, Spelljinxer |
| **Ranger** | rc.conf | CONFIG | Only Spelljinxer |
| **ncspot** | config.toml | CONFIG | Only Spelljinxer |

### GUI Programs & Configs
| Program | Config File | Layer | Notes |
|---------|------------|-------|-------|
| **Waybar** | config + style.css | VISUAL (CSS) + CONFIG (modules) | Standard stack |
| **Quickshell** | shell.qml + modules/ | VISUAL + CONFIG (entire app) | Quickshell native + Hybrid |
| **AGS** | config.js + modules/ | VISUAL + CONFIG (JS app) | JaKooLit, sh1zicus |
| **DMS** | dms config | VISUAL + CONFIG (entire app) | Standalone |
| **Caelestia** | shell.json | VISUAL + CONFIG (entire app) | Standalone |
| **Rofi** | config + theme.rasi | VISUAL (theme) + CONFIG (behavior) | Standard + Hybrid |
| **Hyprlock** | hyprlock.conf | VISUAL | Universal |
| **Hyprland** | hyprland.conf + sourced files | CONFIG (keybinds, rules) | Universal |
| **Dunst** | dunstrc | VISUAL + CONFIG | Standard + Hybrid |
| **swww** | config | VISUAL (wallpaper) | Most repos |
| **SDDM** | theme/ | VISUAL | snes19xx, Spelljinxer |
| **GTK** | settings.ini + gtk.css | VISUAL | ML4W, HyDE |
| **Qt/Kvantum** | kvconfig | VISUAL | End-4, ML4W, HyDE, JaKooLit |
| **Firefox** | userChrome.css, mozilla.cfg | VISUAL | Only snes19xx |
| **Thunar** | thunarrc | CONFIG | End-4, ML4W, snes19xx |
| **Dolphin** | dolphinrc | CONFIG | End-4, HyDE |
