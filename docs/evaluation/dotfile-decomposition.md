# Dotfile Decomposition Framework

> Generated: April 11, 2026
> Method: Manual analysis of each repo's file tree, README, and config files

---

## What Each Dotfile Package Actually Contains

Every dotfile repo breaks down into THREE layers:

### Layer 1: VISUAL (what you see)
- Color schemes (hex values, palettes)
- Wallpaper images
- Icon themes
- Cursor themes
- GTK/KDE themes
- Kvantum configs
- Window decorations (Aurorae, border styles)
- Terminal color schemes
- Terminal fonts
- SDDM/login screen themes
- GRUB themes
- Fonts

### Layer 2: CONFIGURATION (how things behave)
- Keybinds/hotkeys (hyprland.conf, sxhkdrc, etc.)
- Window rules (floating, tiling, sizing)
- Bar config (Waybar style.css + config.jsonc)
- Terminal config (kitty.conf, alacritty.yml, ghostty config)
- Shell config (.zshrc, .bashrc, .fishrc)
- Launcher config (rofi themes, fuzzel.ini)
- Lockscreen config (hyprlock.conf, swaylock config)
- Notification config (dunstrc, mako config)
- Compositor config (hyprland.conf, niri config)
- Power management configs
- Touchpad/mouse configs
- Browser configs (Firefox userChrome.css, etc.)

### Layer 3: INSTALLATION (what you need)
- Package lists (packages.txt, pkglist.txt)
- AUR packages
- Flatpak apps
- Font installations
- System services (systemd units)
- Kernel modules
- Drivers (NVIDIA, etc.)

---

## Decomposition of Top 10 Hyprland Repos

### 1. End-4/dots-hyprland (13,800★)

**VISUAL:**
- Material Design 3 dynamic palette (wallpaper-extracted)
- No bundled wallpaper (uses user's own)
- Icons: Papirus (referenced, not bundled)
- Font: Rubik (UI), CaskaydiaCove NF (terminal), Material Symbols
- No custom GTK theme (uses system)
- No SDDM theme bundled
- Quickshell QML styling (built-in, not external)

**CONFIGURATION:**
- Keybinds: Windows/GNOME-style (Super+/ = help, Super+Enter = terminal)
- Window rules: Custom per-app rules in hyprland.conf
- Bar: Custom Quickshell bar (replaces Waybar entirely)
- Terminal: Not bundled — uses user's choice
- Launcher: Built into Quickshell (fuzzy search + quick actions)
- Lockscreen: Custom Quickshell lockscreen
- Notifications: Custom Quickshell handler with grouping/timeouts
- Compositor: Hyprland with plugins
- AI widgets: Gemini API + Ollama integration in Quickshell

**INSTALLATION:**
- Core: Hyprland, Quickshell, foot, swww, swappy, pavucontrol, lm-sensors
- Optional: Gemini API key, Ollama, Spotify
- Not bundled: Terminal emulator, browser, file manager — user's choice
- Install: One-liner `bash <(curl -s https://ii.clsty.link/get)` with command preview

**Terminal-specific configs:** None bundled — explicitly defers to user's terminal choice
**GUI-specific configs:** Quickshell bar, Quickshell lockscreen, Quickshell notifications, Quickshell launcher
**Both:** Color scheme (applied to both), keybinds, compositor rules

**Dev Activity:** 6,147 commits, daily updates, 13.8k stars, active Discord

---

### 2. Caelestia (8,900★)

**VISUAL:**
- Dynamic `smartScheme` — auto-extracts palette from wallpaper
- Light/Dark mode toggles
- Transparency: base 0.85, layer 0.4, optional blur
- Icons: Material Symbols Rounded
- Fonts: Rubik (UI/clock), CaskaydiaCove NF (mono)
- No bundled wallpaper
- No GTK/KDE theme bundled
- JSON-driven scaling: padding, border rounding (25), spacing

**CONFIGURATION:**
- Keybinds: Hyprland global shortcuts (tightly coupled with Quickshell)
- Bar: Custom Quickshell bar (logo, workspaces, active window, tray, clock, status)
- Terminal: foot (configurable via `general.apps.terminal`)
- Launcher: Built-in (fuzzy search, calc, wallpaper switcher, power, settings)
- Lockscreen: Custom Quickshell (reads ~/.face for PFP)
- Notifications: Custom Quickshell with grouping/expiry/action-on-click
- Wallpaper: Built-in manager/switcher (`caelestia wallpaper` CLI)
- Power management: Granular timeouts (lock, DPMS, suspend-then-hibernate)

**INSTALLATION:**
- Core: Hyprland, Quickshell, foot, swappy, lm-sensors, pavucontrol
- Optional: libcava (audio visualizer)
- Install: AUR `caelestia-meta` or Nix flake

**Terminal-specific configs:** foot config (colors, font, padding, cursor)
**GUI-specific configs:** Quickshell bar, lockscreen, notifications, launcher, wallpaper manager
**Both:** Color scheme (JSON `smartScheme`), keybinds

**Dev Activity:** 8.9k stars, 579 forks, active development, Reddit favorite

---

### 3. DankMaterialShell (5,600★)

**VISUAL:**
- Dynamic matugen + dank16 — wallpaper-driven auto-theming
- GTK, Qt, terminals, VS Code all synced automatically
- No bundled wallpaper
- No specific icon/cursor/font bundled
- Light/Dark modes

**CONFIGURATION:**
- Bar: Custom Quickshell QML panels (replaces Waybar)
- Launcher: dsearch (Spotlight-style — apps, files, emojis, windows, calc, CLI, plugins)
- Lockscreen: Custom (replaces swaylock/swayidle, separate AC/battery profiles)
- Notifications: Custom (replaces mako, smart grouping, rich text, keyboard nav)
- Control Center: Unified panel (network, BT, audio, display, night mode, calendar, weather, clipboard with image previews)
- Media: MPRIS integration
- System Monitor: Real-time CPU/RAM/GPU via dgop + searchable process manager

**INSTALLATION:**
- Core: DMS binary (Quickshell QML + Go backend)
- One-command install across 6 distros
- NixOS & home-manager module
- MIT Licensed
- Compositor-agnostic (Hyprland, niri, Sway, MangoWC, labwc, Scroll, MiracleWM)

**Terminal-specific configs:** NONE — DMS doesn't configure terminals
**GUI-specific configs:** Everything — DMS IS the GUI layer
**Both:** Color scheme (matugen extraction)

**Dev Activity:** 5.6k stars, cross-compositor, unique architecture (monolithic vs modular)

---

### 4. ML4W OS (4,600★)

**VISUAL:**
- Adaptive material colors from wallpaper
- Dark/Light modes
- No bundled wallpaper
- No specific icon/cursor/font bundled
- Waybar CSS styling included

**CONFIGURATION:**
- Bar: Waybar (Default + Simple-L [TOP] layouts)
- Launcher: Rofi + AGS
- Terminal: Kitty + TTY config
- Lockscreen: Hyprlock
- Wallpaper: swww + wallust
- Notifications: Dunst
- Window rules: Hyprland rules
- Keybinds: Standard Hyprland keybinds

**INSTALLATION:**
- Core: Hyprland, Waybar, Rofi, AGS, Kitty, Hyprlock, swww, wallust, Dunst, Thunar, Neovim, Zsh
- Live ISO for testing
- One-command disk install (`sudo install-ml4w-os` BETA)
- Arch, Fedora, openSUSE support

**Terminal-specific configs:** Kitty config (colors, font, cursor, keybinds), TTY config
**GUI-specific configs:** Waybar, Rofi, AGS, Hyprlock, Dunst, Thunar
**Both:** Wallust color extraction (applies to both), keybinds

**Dev Activity:** 2,811 commits, 39 releases, active

---

### 5. HyDE (8,700★)

**VISUAL:**
- Wallbash modes — dynamic color extraction from wallpaper
- Native dark/light mode
- GTK/Qt/Shell/SDDM/GRUB integration
- Community themes via `kRHYME7/hyde-gallery`
- Wallpaper selector, theme selector

**CONFIGURATION:**
- Bar: Waybar
- Launcher: Rofi
- Power/Logout: Wlogout
- Gaming: Game Launcher
- Terminal: Kitty (implied)
- Notifications: Notification Action UI
- Window rules: Hyprland rules
- Keybinds: Standard Hyprland

**INSTALLATION:**
- Core: Hyprland, Waybar, Rofi, Kitty, Hyprlock, swww, Dunst, Dolphin, Neovim, Zsh
- NVIDIA auto-detect (nvidia-open-dkms)
- Auto-backups to ~/.config/cfg_backups
- HyDEVM for VM testing
- Arch + NixOS

**Terminal-specific configs:** Kitty config, Zsh config, Starship prompt
**GUI-specific configs:** Waybar, Rofi, Hyprlock, Dunst, Dolphin, Wlogout
**Both:** Wallbash color extraction, keybinds

**Dev Activity:** 8.7k stars, 595 forks, community-driven, all-contributors spec

---

### 6. JaKooLit (3,300★)

**VISUAL:**
- wallust — auto-extracts palette from wallpaper (SUPER+W)
- Dark/light wallpaper pairs
- 2K display optimized (1440p default)
- No bundled wallpaper
- No specific icon/cursor/font bundled

**CONFIGURATION:**
- Bar: Waybar (Default + Simple-L [TOP] layouts)
- Launcher: Rofi + AGS
- Terminal: Kitty + TTY config
- Lockscreen: Hyprlock (implied)
- Wallpaper: swww + wallust
- Notifications: Dunst
- Window rules: Hyprland rules
- Keybinds: SUPER+H = HINT! module, SUPER+W = wallust trigger

**INSTALLATION:**
- Core: Hyprland, Waybar, Rofi, AGS, Kitty, Hyprlock, swww, wallust, Dunst, Thunar
- NVIDIA: Manual env var edit post-install
- Auto-backups before touching anything
- 6-distro support (Arch, openSUSE, Fedora, Debian, NixOS, Ubuntu)
- Versioned workflows (release.sh stable, upgrade.sh rsync)

**Terminal-specific configs:** Kitty config, TTY config
**GUI-specific configs:** Waybar, Rofi, AGS, Hyprlock, swww, wallust, Dunst, Thunar
**Both:** Wallust color extraction, keybinds

**Dev Activity:** 3.3k stars, 346 forks, archived March 2026, handed to LinuxBeginnings

---

### 7. snes19xx/surface-dots (private stars)

**VISUAL:**
- Custom Everforest GTK (Fausto-Korpsvart base)
- Kvantum theme + qt6ct
- Papirus icons, Volantes cursors
- Iosevka Nerd Font Mono, Inter, Manrope
- SDDM "pixel" theme (from mahaveergurjar)
- 14 GLSL shaders (hyprshade)
- Surface Laptop 4 ICC color profile

**CONFIGURATION:**
- Bar: Quickshell (dual-mode: top-bar + taskbar)
- Launcher: Rofi + Quickshell Drawer
- Terminal: Kitty
- Lockscreen: Hyprlock
- Wallpaper: waypaper-git
- Notifications: Dunst (auto-collapse with media)
- Control Hub: Quickshell snes-hub
- Firefox: Custom start.html (procedural sky/weather), userChrome.css
- Calendar: vdirsyncer + khal (Google CalDAV)
- Keybinds: Super+key combos, scratchpad (special:magic)

**INSTALLATION:**
- Core: Hyprland + plugins, Quickshell, Kitty, Hyprlock, waypaper, Dunst, Thunar, Firefox
- Optional: auto-cpufreq, howdy-git (face unlock), vdirsyncer, khal
- GUI installer (WebKitGTK + polkit)
- Arch-glibc tested

**Terminal-specific configs:** Kitty config (Everforest colors, font, padding, cursor)
**GUI-specific configs:** Quickshell bar, Quickshell Hub, Hyprlock, waypaper, Dunst, Thunar, Firefox, SDDM
**Both:** Everforest GTK+Kvantum+Qt6ct, GLSL shaders, keybinds, Calendar sync

**Dev Activity:** Surface-specific, 3:2 HiDPI optimized, deep Everforest consistency

---

### 8. Spelljinxer/Bocchi (509★)

**VISUAL:**
- Bocchi the Rock! anime palette (soft pinks, lavender, muted blues)
- pywal — fluid palette from wallpapers
- sddm-flower-theme
- Icons: pywal-generated
- Terminal: pywal-synced

**CONFIGURATION:**
- Bar: Waybar (pywal-synced)
- Launcher: Rofi (pywal-synced)
- Terminal: Kitty (pywal-synced)
- Lockscreen: Hyprlock (pywal-synced)
- Wallpaper: pywal extraction
- File Manager: Ranger (TUI)
- Editor: Neovim/NvChad
- Shell: Zsh + Powerlevel10k
- Music: ncspot (Spotify TUI) + cava (visualizer) + sptlrx (lyrics)
- Fun: tomato-c (Pomodoro), cbonsai, colorscripts, asciiquarium

**INSTALLATION:**
- Core: Hyprland, Waybar, Rofi, Kitty, Hyprlock, sddm, pywal, Ranger, Neovim, Zsh
- Optional: ncspot, cava, sptlrx, tomato-c, cbonsai, colorscripts, asciiquarium
- Install: Clone + manual

**Terminal-specific configs:** Kitty (pywal-synced), Ranger, Neovim/NvChad, Zsh/P10k, ncspot, cava
**GUI-specific configs:** Waybar, Rofi, Hyprlock, sddm-flower-theme
**Both:** pywal color extraction, keybinds, wallpaper sync

**Dev Activity:** 509 stars, 20 forks, 73 commits, Arch-only

---

### 9. sh1zicus (98★)

**VISUAL:**
- Material Design 3 palette (End-4 fork base)
- Custom AGS modules styling
- No bundled wallpaper
- No specific icon/cursor/font bundled

**CONFIGURATION:**
- Bar: Waybar + AGS
- Launcher: Rofi
- Terminal: Kitty
- Lockscreen: Hyprlock
- Wallpaper: swww
- Notifications: Dunst
- Window rules: End-4 base + custom
- Keybinds: End-4 base + custom

**INSTALLATION:**
- Core: Hyprland, Waybar, AGS, Rofi, Kitty, Hyprlock, swww, Dunst
- Install: Guided transparent installer for Arch

**Terminal-specific configs:** Kitty config
**GUI-specific configs:** Waybar, AGS modules, Rofi, Hyprlock, swww, Dunst
**Both:** Color scheme, keybinds

**Dev Activity:** 98 stars, End-4 fork, less maintained

---

### 10. R7rainz/Noctalia (40★)

**VISUAL:**
- Dark/black aesthetic
- Custom SDDM theme
- No bundled wallpaper
- No specific icon/cursor/font bundled

**CONFIGURATION:**
- Bar: Quickshell/Noctalia Shell
- Launcher: Rofi
- Terminal: Kitty
- Lockscreen: Hyprlock
- Wallpaper: swww
- Notifications: Dunst/SwayNC
- Editor: Neovim

**INSTALLATION:**
- Core: Hyprland, Quickshell, Rofi, Kitty, Hyprlock, swww, Dunst, SwayNC, Neovim
- Install: Manual clone

**Terminal-specific configs:** Kitty config, Neovim config
**GUI-specific configs:** Quickshell/Noctalia, Rofi, Hyprlock, swww, Dunst/SwayNC
**Both:** Color scheme, keybinds, SDDM theme

**Dev Activity:** 40 stars, minimal, Noctalia Shell is unique

---

## Terminal vs GUI Component Mapping

### TERMINAL Programs & Configs
| Program | Config File | Layer |
|---------|------------|-------|
| **Kitty** | ~/.config/kitty/kitty.conf | VISUAL (colors, font) + CONFIG (keybinds, behavior) |
| **foot** | ~/.config/foot/foot.ini | VISUAL + CONFIG |
| **Ghostty** | ~/.config/ghostty/config | VISUAL + CONFIG |
| **Alacritty** | ~/.config/alacritty/alacritty.yml | VISUAL + CONFIG |
| **Ranger** | ~/.config/ranger/ | CONFIG |
| **Neovim** | ~/.config/nvim/ | CONFIG |
| **Zsh** | ~/.zshrc, ~/.p10k.zsh | CONFIG |
| **Starship** | ~/.config/starship.toml | CONFIG |
| **tmux** | ~/.tmux.conf | CONFIG |
| **Fastfetch/Catnip** | ~/.config/fastfetch/ | VISUAL (output format) |
| **ncspot** | ~/.config/ncspot/ | CONFIG |
| **cava** | ~/.config/cava/config | VISUAL (audio visualizer) |
| **cbonsai/asciiquarium** | N/A | None (just installed) |

### GUI Programs & Configs
| Program | Config File | Layer |
|---------|------------|-------|
| **Waybar** | ~/.config/waybar/config + style.css | VISUAL (CSS) + CONFIG (modules) |
| **Quickshell** | ~/.config/quickshell/ or built-in | VISUAL + CONFIG |
| **AGS** | ~/.config/ags/ | VISUAL + CONFIG |
| **Rofi** | ~/.config/rofi/ | VISUAL (theme) + CONFIG (keybinds) |
| **Hyprlock** | ~/.config/hypr/hyprlock.conf | VISUAL |
| **Hyprland** | ~/.config/hypr/hyprland.conf | CONFIG (keybinds, rules, plugins) |
| **Dunst** | ~/.config/dunst/dunstrc | VISUAL + CONFIG |
| **SwayNC** | ~/.config/swaync/ | VISUAL + CONFIG |
| **swww** | ~/.config/swww/ | VISUAL (wallpaper) |
| **SDDM** | /usr/share/sddm/themes/ | VISUAL |
| **Thunar** | ~/.config/Thunar/ | CONFIG |
| **Dolphin** | ~/.config/dolphinrc | CONFIG |
| **Firefox** | userChrome.css, mozilla.cfg | VISUAL |
| **GTK** | ~/.config/gtk-3.0/settings.ini | VISUAL |
| **Qt/Kvantum** | ~/.config/kvantum/ | VISUAL |

### Both Terminal + GUI
| Element | Files | Layer |
|---------|-------|-------|
| **Color scheme** | kitty.conf, waybar CSS, rofi theme, hyprlock, terminal colors, GTK/Qt | VISUAL |
| **Keybinds** | hyprland.conf, sxhkdrc | CONFIG |
| **Wallpaper** | swww config, waypaper, pywal palette | VISUAL |
| **Fonts** | kitty.conf, GTK settings, Qt settings, Hyprland font config | VISUAL |
| **Icons** | GTK settings, Qt/Kvantum | VISUAL |
| **Cursors** | GTK settings, Hyprland cursor config | VISUAL |

---

## What Persists vs. What Changes Between Packages

### ALWAYS PERSISTS (not touched by dotfile packages)
- User data (Documents, Downloads, Pictures)
- Browser bookmarks/history/passwords
- SSH keys, GPG keys
- Git global config
- ~/.local/share/applications (custom .desktop files)
- ~/.local/share/keyrings (passwords)
- System packages (installed programs stay installed)
- /etc/ configs (system-wide settings)

### SOMETIMES CHANGES (depends on package)
- ~/.config/hypr/ — usually replaced
- ~/.config/kitty/ — sometimes replaced
- ~/.config/waybar/ — usually replaced
- ~/.config/rofi/ — sometimes replaced
- ~/.config/dunst/ — sometimes replaced
- ~/.config/gtk-3.0/ — sometimes replaced
- ~/.config/kvantum/ — sometimes replaced
- ~/.zshrc — rarely replaced (usually just terminal configs)
- ~/.config/autostart/ — rarely touched

### USUALLY REPLACED (core dotfile content)
- hyprland.conf
- waybar config + CSS
- rofi theme
- kitty.conf
- hyprlock.conf
- swww wallpaper
- dunstrc
- GTK theme settings
- Kvantum theme

---

## Existing Tools That Do Parts of This

| Tool | What It Does | What It Doesn't Do |
|------|-------------|-------------------|
| **GNU Stow** | Symlinks dotfiles from a dir | Doesn't decompose, doesn't switch themes |
| **chezmoi** | Manages dotfiles with templates | Doesn't decompose visual/config/install |
| **NixOS/Home Manager** | Declarative system config | Doesn't do theme switching |
| **pywal/wallust** | Extracts colors from wallpaper | Doesn't touch configs, keybinds, programs |
| **KDE Global Themes** | One-click visual theme swap | Visual only, KDE-only |
| **HyDE themepatcher** | Swaps themes between HyDE configs | Theme only, not configs |
| **DankMaterialShell** | Replaces 6+ tools in one binary | Doesn't do modular switching |
| **Caelestia JSON config** | Easy theme/config changes via JSON | Single-repo only |

**Nothing decomposes dotfile repos into visual/config/install layers and lets you mix-match.**

---

## What the User Is Actually Building

A **modular dotfile switcher** that:
1. Parses any dotfile repo into three layers (Visual, Config, Install)
2. Lets you pick Visual from Repo A + Config from Repo B + Install from Repo C
3. Shows exactly what each layer changes before you apply it
4. Terminal styling mirrors GUI styling by default, optionally diverges
5. Shows what persists vs. what gets replaced when you switch
6. Works on both KDE and Hyprland
7. Includes real screenshots so you can see what you're getting

This is genuinely novel. No existing tool does this.
