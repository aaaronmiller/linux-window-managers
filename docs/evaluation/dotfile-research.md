# Dotfile Repository Research — Top 10 + What snes19xx Does

> Generated: April 10, 2026
> Method: Manual GitHub + Reddit research

---

## What snes19xx/surface-dots Customizes (The Baseline)

**Component Coverage: 10/10**

| Element | What They Customize | Tool |
|---------|-------------------|------|
| **Compositor** | Hyprland + plugins | hyprland.conf |
| **Bar** | Dual-mode Quickshell (top-bar + taskbar), screen borders, album-art extraction | Quickshell QML |
| **Launcher** | Rofi + Quickshell Drawer (Windows 10-style in taskbar mode) | rofi + Drawer.qml |
| **Terminal** | Kitty — Everforest themed | kitty.conf |
| **Lockscreen** | Hyprlock — Everforest themed | hyprlock.conf |
| **Login Screen** | Custom SDDM "pixel" theme | sddm/theme.conf |
| **Wallpaper** | waypaper-git with Surface defaults | waypaper |
| **Notifications** | Dunst — themed, auto-collapse with media | dunstrc |
| **Control Hub** | Quickshell snes-hub — toggles, sliders, battery, MPRIS, calendar, weather, notifications | snes-hub QML |
| **File Manager** | Thunar | thunar config |
| **GLSL Shaders** | 14 total — reading mode, night, outdoor, cinema, CRT, VHS, GameBoy, IBM 3278, Fuji Acros, Night Vision, Focus | hyprshade |
| **GTK Theme** | Custom Everforest GTK (Fausto-Korpsvart base) | GTK CSS |
| **Qt/KDE** | Kvantum + qt6ct — Everforest | kvantum.kvconfig |
| **Icons** | Papirus | icon theme |
| **Cursors** | Volantes | cursor theme |
| **Fonts** | Iosevka Nerd Font Mono, Inter, Manrope, Nerd Symbols | fontconfig |
| **Firefox** | Custom start.html (procedural sky/weather), userChrome.css, autoconfig | mozilla.cfg |
| **Calendar Sync** | Google CalDAV via vdirsyncer + khal | vdirsyncer.conf |
| **Dynamic Theming** | QML ThemeEngine — dark/light toggle, album-art palette extraction | ThemeEngine.qml |
| **Installer** | GUI installer (WebKitGTK + polkit) | surface-dots-installer |

**What makes it cohesive:** ONE palette (Everforest) applied to EVERYTHING — GTK, Qt, QML, terminal, Rofi, Hyprlock, Firefox, SDDM, icons, cursors, fonts, GLSL shaders. 14 shaders add functional beauty. Dual bar modes show attention to workflow. Custom Firefox start page shows obsessive detail.

---

## Top 10 Real Dotfile Repos (Equal or Better Than snes19xx)

### 1. end-4/dots-hyprland — "Illogical Impulse"
- **Stars:** 13,800 | **Forks:** 1,100 | **Commits:** 6,147
- **Components:** Quickshell bar (not Waybar), AI widgets (Gemini + Ollama), live app overview with previews, Hyprlock, swww, Dunst/SwayNC, Rofi, Kitty, Thunar
- **Theme:** Material Design 3 — dynamic colors from wallpaper, Windows 11 + osu!lazer inspired
- **Unique:** Built-in AI assistant widgets, live window previews, Quickshell-only bar (ditches Waybar), 6,000+ commits, Discord community
- **Polish Level:** ★★★★★ — Most starred Hyprland dots. Deeply polished. Daily updates.
- **Install:** One-liner `bash <(curl -s https://ii.clsty.link/get)`
- **Distro:** Arch primary, Fedora community support
- **What snes19xx does better:** 14 GLSL shaders, Surface hardware fixes, e-ink reading mode
- **What end-4 does better:** AI widgets, live app overview, 13.8k stars, daily updates, bigger community

### 2. caelestia-dots/shell — "Caelestia"
- **Stars:** 8,900 | **Forks:** 579 | **Commits:** N/A
- **Components:** Quickshell bar (custom), Quickshell lockscreen, Quickshell notifications, Quickshell widgets, Quickshell launcher, foot terminal, Thunar, swappy, MPRIS media
- **Theme:** Dynamic `smartScheme` — auto-extracts palette from wallpaper, light/dark modes
- **Unique:** Entirely JSON-configured (no code edits needed), NixOS first-class support, animated GIFs for media/session states, advanced hover popouts, CLI for everything (`caelestia shell ...`)
- **Polish Level:** ★★★★★ — "Clean and unified with minimum bloat" (Reddit consensus favorite)
- **Install:** AUR `caelestia-meta` or Nix flake
- **Distro:** Arch/NixOS
- **What snes19xx does better:** GLSL shaders, Surface hardware fixes, Google Calendar sync, Firefox customization
- **What Caelestia does better:** JSON-only config (easiest to customize), animated session states, minimal bloat, NixOS support

### 3. HyDE-Project/hyde — "Hyprland Development Environment"
- **Stars:** 8,700 | **Forks:** 595 | **Commits:** N/A
- **Components:** Waybar, Rofi, Wlogout, Kitty, Hyprlock, swww, Dunst, Dolphin, Neovim, Zsh, Fastfetch
- **Theme:** Wallbash modes — dynamic color extraction from wallpaper, GTK/Qt/Shell/SDDM/GRUB integration
- **Unique:** themepatcher ecosystem (decoupled theme repo), HyDEVM for risk-free testing, strict config rollback with git hard-reset, community-driven with all-contributors spec, NixOS support (Hydenix)
- **Polish Level:** ★★★★☆ — Massive, feature-rich, but complex
- **Install:** Arch/NixOS installer scripts
- **Distro:** Arch, NixOS
- **What snes19xx does better:** GLSL shaders, Quickshell hub, Surface hardware fixes, e-ink reading mode
- **What HyDE does better:** VM sandbox for testing, strict config rollback, NixOS flake, community governance, SDDM+GRUB theming

### 4. mylinuxforwork/dotfiles — "ML4W OS"
- **Stars:** 4,600 | **Forks:** 341 | **Commits:** 2,811
- **Components:** Quickshell bar, AGS widgets, Rofi, Kitty, Hyprlock, swww, Dunst, Thunar, Neovim, Zsh
- **Theme:** Adaptive material colors from wallpaper, dark/light modes
- **Unique:** Branded as "ML4W OS" (complete desktop environment, not just dots), Live ISO for testing, one-command disk install (`sudo install-ml4w-os`), first-class Arch/Fedora/openSUSE support
- **Polish Level:** ★★★★☆ — Production-ready, but complex
- **Install:** `bash <(curl -s https://ml4w.com/os/stable)`
- **Distro:** Arch, Fedora, openSUSE
- **What snes19xx does better:** GLSL shaders, Surface hardware fixes, Firefox customization, e-ink reading mode
- **What ML4W does better:** Live ISO, one-command disk install, 3 distro support, branded as complete OS

### 5. AvengeMedia/DankMaterialShell — "DMS"
- **Stars:** 5,600 | **Forks:** N/A | **Commits:** N/A
- **Components:** Quickshell bar, Spotlight launcher (dsearch), Quickshell lockscreen, Quickshell notifications, Quickshell control center, MPRIS media, system monitor (dgop)
- **Theme:** Dynamic matugen + dank16 — wallpaper-driven auto-theming for GTK, Qt, terminals, VS Code
- **Unique:** Monolithic architecture — replaces 6+ tools (waybar, swaylock, swayidle, mako, fuzzel, polkit) in one Quickshell+Go binary, compositor-agnostic (works on niri, Hyprland, MangoWC, Sway, labwc, Scroll, MiracleWM)
- **Polish Level:** ★★★★★ — Most unified architecture of any dotfile pack
- **Install:** One-command across 6 distros
- **Distro:** Arch, Fedora, Debian, Ubuntu, openSUSE, Gentoo
- **What snes19xx does better:** GLSL shaders, Surface hardware fixes, Google Calendar sync
- **What DMS does better:** Compositor-agnostic (works on 7 WMs), replaces 6+ tools in one binary, MIT licensed, NixOS module

### 6. JaKooLit/Hyprland-Dots
- **Stars:** 3,300 | **Forks:** 346 | **Commits:** N/A
- **Components:** Waybar (2 layouts), Rofi + AGS, Kitty, swww + wallust, Hyprlock, Dunst, Thunar, Neovim, Zsh
- **Theme:** wallust — auto-extracts palette from wallpaper (SUPER+W), applies to Waybar/Kitty/Rofi
- **Unique:** Multi-distro auto-installer (Arch, openSUSE, Fedora, Debian, NixOS, Ubuntu), versioned workflows (release.sh pulls stable, upgrade.sh uses rsync), zero-package guarantee (only config files)
- **Polish Level:** ★★★★☆ — Most distro support, but Jan 2026 archival
- **Install:** `sh <(curl -L https://raw.githubusercontent.com/JaKooLit/Hyprland-Dots/main/Distro-Hyprland.sh)`
- **Distro:** Arch, openSUSE, Fedora, Debian, NixOS, Ubuntu
- **What snes19xx does better:** GLSL shaders, Surface hardware fixes, Quickshell hub, Firefox customization
- **What JaKooLit does better:** 6-distro support, versioned workflows, zero-package guarantee, largest installer ecosystem

### 7. Spelljinxer/dotfiles — "Bocchi"
- **Stars:** 509 | **Forks:** 20 | **Commits:** 73
- **Components:** Hyprland, Waybar, Rofi, Kitty, Hyprlock, sddm-flower-theme, pywal, Ranger (TUI file manager), Neovim/NvChad, ncspot (Spotify TUI), cava (audio visualizer), sptlrx (lyrics), tomato-c (Pomodoro), cbonsai, asciiquarium, colorscripts
- **Theme:** pywal — fluid palette extraction from Bocchi the Rock! wallpapers
- **Unique:** Anime-themed (Bocchi the Rock!), terminal ambiance (cbonsai, asciiquarium), Spotify TUI with lyrics, Pomodoro timer, pywal-synced everything
- **Polish Level:** ★★★☆☆ — Fun, personalized, but less professional
- **Install:** Clone + manual
- **Distro:** Arch only
- **What snes19xx does better:** Surface hardware fixes, GLSL shaders, Quickshell hub, GTK+Qt+Kvantum sync
- **What Spelljinxer does better:** Terminal ambiance, music player integration, anime theme personality

### 8. snes19xx/surface-dots
- **Stars:** N/A (private repo) | **Forks:** N/A | **Commits:** N/A
- **Components:** Hyprland + plugins, Quickshell (dual mode), Rofi + Quickshell Drawer, Kitty, Hyprlock, Custom SDDM "pixel", waypaper, Dunst, Thunar, Firefox (custom)
- **Theme:** Custom Everforest GTK + Kvantum + Qt6ct — cohesive earthy palette
- **Unique:** 14 GLSL shaders, Surface Laptop 4 optimized, e-ink reading mode, Google Calendar sync, Firefox procedural sky, dual bar modes, album-art extraction, custom installer
- **Polish Level:** ★★★★★ — Most cohesive single aesthetic, deepest GLSL suite
- **Install:** GUI installer (surface-dots-installer)
- **Distro:** Arch (tested), others possible
- **What makes it special:** ONE palette everywhere, 14 shaders, Surface-optimized

### 9. sh1zicus/dots-hyprland
- **Stars:** 98 | **Forks:** N/A | **Commits:** N/A
- **Components:** AGS widgets, Hyprlock, Dunst/SwayNC, Waybar, Rofi, Kitty, Hyprland
- **Theme:** End-4 fork — Material Design 3 with custom palette
- **Unique:** Fork of end-4 with custom AGS modules, custom installer
- **Polish Level:** ★★★☆☆ — Good fork but less maintained
- **Install:** Guided installer for Arch
- **Distro:** Arch
- **What snes19xx does better:** Everything — original work, GLSL shaders, Surface fixes
- **What sh1zicus does better:** AGS widget customization

### 10. R7rainz/dotfiles — "Noctalia Shell"
- **Stars:** 40 | **Forks:** N/A | **Commits:** N/A
- **Components:** Quickshell/Noctalia shell bar, Waybar, Hyprlock, Dunst, SwayNC, Rofi, Kitty, Neovim, Hyprland
- **Theme:** Dark/black aesthetic, custom SDDM
- **Unique:** Noctalia Shell — custom Quickshell-based desktop shell, sleek minimal status bar
- **Polish Level:** ★★★☆☆ — Minimal but polished
- **Install:** Manual clone
- **Distro:** Arch
- **What snes19xx does better:** GLSL shaders, Surface fixes, dual bar modes, Firefox customization
- **What R7rainz does better:** Noctalia Shell (custom desktop shell)

---

## Comprehensive List of Configurable Elements

### Core Components (12)
1. **Compositor** — Hyprland, niri, Sway, etc.
2. **Bar** — Waybar, Quickshell, AGS, EWW, custom
3. **Launcher** — Rofi, Fuzzel, Wofi, dmenu, Quickshell Drawer
4. **Terminal** — Kitty, foot, Alacritty, Ghostty
5. **Lockscreen** — Hyprlock, Swaylock, custom Quickshell
6. **Login Manager** — SDDM (with custom theme), GDM
7. **Wallpaper** — swww, waypaper, hyprpaper
8. **Notifications** — Dunst, SwayNC, Mako
9. **Widgets/Hub** — AGS, Quickshell, EWW, custom
10. **File Manager** — Thunar, Dolphin, Nemo, Ranger
11. **Browser** — Firefox (custom), Zen, Chrome
12. **Screenshot** — grim + slurp + swappy, Hyprshot

### Visual Elements (15)
13. **GTK Theme** — CSS-based theme for GTK apps
14. **Qt/KDE Theme** — Kvantum, qt6ct
15. **Icon Theme** — Papirus, Tela, etc.
16. **Cursor Theme** — Volantes, Bibata, etc.
17. **Fonts** — Terminal, UI, monospace, Nerd Fonts
18. **Color Scheme** — Static palette or dynamic (wallpaper-extracted)
19. **SDDM Theme** — Login screen appearance
20. **GRUB Theme** — Boot menu appearance
21. **Splash Screen** — Boot animation
22. **Terminal Colorscheme** — Terminal-specific palette
23. **Bar Layout** — Top, bottom, floating, dual-mode
24. **Window Decorations** — Rounded corners, borders, shadows
25. **Animations** — Transitions, easing curves, durations
26. **Opacity/Transparency** — Window, bar, widget opacity
27. **Blur** — Bar blur, widget blur, window blur

### Functional Elements (12)
28. **Keybinds** — Window management, app launch, screenshots
29. **Window Rules** — Floating, tiling, sizing, positioning
30. **Workspaces** — Number, layout, naming, special workspaces
31. **Touchpad Gestures** — Swipe, pinch, tap configurations
32. **Power Management** — Suspend, hibernate, idle timeouts
33. **Audio Control** — Volume, output switching, MPRIS
34. **Network** — WiFi menu, VPN toggles, BT management
35. **Clipboard** — Clipboard manager, history
36. **Calendar** — Calendar widget, event sync
37. **Weather** — Weather widget, location
38. **System Monitor** — CPU, RAM, GPU, battery, sensors
39. **Media Player** — MPRIS integration, Spotify, etc.

### Advanced Elements (8)
40. **GLSL Shaders** — Reading mode, night filter, CRT, etc.
41. **Dynamic Theming** — Wallpaper-driven palette extraction
42. **AI Integration** — Gemini, Ollama widgets
43. **Calendar Sync** — Google CalDAV, vdirsyncer
44. **Firefox Customization** — start.html, userChrome.css, autoconfig
45. **Neovim Config** — NvChad, LazyVim, custom
46. **Shell Config** — Zsh, Fish, Powerlevel10k, Starship
47. **Git Config** — Aliases, hooks, commit templates

---

## Deliberative Refinement — What We Have vs What We Need

### What We Have
- 3 transition scripts (KDE, Hyprland, theme-manager)
- 10 fake themes (color presets, not curated repos)
- Basic feature comparison table
- Showcase website with mock previews

### What We're Missing
- **Real screenshots** from actual dotfile repos
- **Curated repos** vs made-up themes
- **Deep comparison** of what each repo actually customizes
- **Feature-by-feature** comparison against snes19xx
- **Actual component lists** for each repo
- **Star counts, fork counts, commit counts**
- **Installation methods** for each
- **Distro support** comparison
- **Polish ratings** based on community feedback

### What The User Wants
1. 10 REAL dotfile repos that are equal to or better than snes19xx
2. Actual screenshots from each
3. Component-by-component comparison
4. What each one customizes (the comprehensive list above)
5. Star counts, community size, maintenance status
6. A showcase site that says "WOW" not "meh"
7. Quality over quantity — deep research, not surface-level

### Revised Plan
1. **Pick top 10 repos** from the research above (End-4, Caelestia, HyDE, ML4W, DMS, JaKooLit, Spelljinxer, snes19xx, sh1zicus, R7rainz)
2. **Get actual screenshots** from each repo's README/assets
3. **Build comparison matrix** — 47 configurable elements × 10 repos
4. **Rebuild showcase site** with real screenshots, real data, real comparisons
5. **Add theme installer** — download and apply any of the 10 repos with one command
6. **Iterate 10 times** — refine based on user feedback
