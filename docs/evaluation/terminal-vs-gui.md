# Terminal vs GUI File Mapping — All 10 Repos

> Generated: April 11, 2026
> Method: Examined actual config files in every repo, categorized each program

---

## Classification System

| Category | Definition |
|----------|-----------|
| **TERMINAL** | Programs that run inside a terminal emulator (shell, TUI apps, CLI tools) |
| **GUI** | Graphical applications with their own windows (bars, launchers, notification daemons, file managers) |
| **BOTH** | Programs that affect both terminal and GUI (compositor, color engines, font config, themes) |

---

## Program-by-Program Classification

| Program | Category | Config Files | What It Controls |
|---------|----------|-------------|-----------------|
| **kitty** | TERMINAL | kitty.conf + theme files | Terminal emulator: colors, font, padding, keybinds, shell, cursor, scrollback |
| **foot** | TERMINAL | foot.ini | Terminal emulator: colors, font, padding, keybinds, shell, scrollback |
| **ghostty** | TERMINAL | ghostty.config | Terminal emulator: colors, font, padding, keybinds, shell |
| **alacritty** | TERMINAL | alacritty.toml | Terminal emulator: colors, font, padding, keybinds |
| **wezterm** | TERMINAL | wezterm.lua | Terminal emulator: colors, font, padding, keybinds, tabs |
| **zshrc** | TERMINAL | .zshrc, .zshrc.d/* | Shell: aliases, prompt, completions, history, keybinds |
| **bashrc** | TERMINAL | .bashrc, .bashrc.d/* | Shell: aliases, prompt, completions, history |
| **fish** | TERMINAL | config.fish, functions/* | Shell: functions, prompt, completions, abbreviations |
| **starship** | TERMINAL | starship.toml | Shell prompt theme: symbols, format, colors |
| **ohmyposh** | TERMINAL | themes/*.json, *.toml | Shell prompt theme: segments, style, colors |
| **tmux** | TERMINAL | .tmux.conf | Terminal multiplexer: panes, keybinds, status bar |
| **nvim** | TERMINAL | init.lua, lua/* | Terminal text editor: plugins, keybinds, themes, LSP |
| **vim** | TERMINAL | .vimrc | Terminal text editor: plugins, keybinds, themes |
| **ranger** | TERMINAL | rc.conf, plugins/* | Terminal file manager: keybinds, preview, theme |
| **btop** | TERMINAL | btop.conf, themes/* | Terminal system monitor: theme, update interval, graphs |
| **cava** | TERMINAL | config, shaders/* | Terminal audio visualizer: bars, colors, shaders |
| **catnip** | TERMINAL | configs | Terminal system info display (custom tool) |
| **ncspot** | TERMINAL | config.toml | Terminal Spotify client: theme, keybinds |
| **sptlrx** | TERMINAL | config | Terminal lyrics sync tool |
| **fastfetch** | TERMINAL | config.jsonc, logos/* | Terminal system info: logo, colors, format |
| **lsd** | TERMINAL | config.yaml | Terminal ls replacement: colors, icons, sorting |
| **hyprland** | BOTH | hyprland.conf, execs.conf, rules.conf, etc. | Compositor: window rules, keybinds, animations, execs, monitors |
| **hypridle** | GUI | hypridle.conf | Idle daemon: lock, suspend, DPMS timeouts |
| **hyprlock** | GUI | hyprlock.conf | Lockscreen: layout, labels, input field, images |
| **hyprpaper** | GUI | hyprpaper.conf | Wallpaper daemon: wallpaper paths, preload |
| **hyprsunset** | GUI | hyprsunset.conf | Blue light filter: temperature, schedule |
| **waybar** | GUI | config, style.css | Bar: modules, layout, CSS styling, themes |
| **quickshell** | GUI | shell.qml, modules/*, services/* | Desktop shell: bar, launcher, lock, notifications, sidebar, AI |
| **ags** | GUI | config.js, modules/* | GTK shell: widgets, overview, notifications |
| **rofi** | GUI | config.rasi, themes/* | Application launcher: layout, theme, keybinds |
| **dunst** | GUI | dunstrc | Notification daemon: layout, colors, timeouts, rules |
| **swaync** | GUI | config.json, style.css | Notification center: layout, widgets, CSS |
| **mako** | GUI | config | Notification daemon (wlroots): colors, format, actions |
| **wlogout** | GUI | layout, style.css | Logout menu: layout, buttons, CSS |
| **swaylock** | GUI | swaylock/config | Lockscreen: colors, indicator, images |
| **nwg-dock** | GUI | config, colors.css | Dock: icons, spacing, colors |
| **walker** | GUI | config.json | App launcher: search, layout, themes |
| **sidepad** | GUI | config | Note-taking app: layout, themes |
| **qt5ct** | GUI | qt5ct.conf | Qt5 theme switcher: style, font, icon theme |
| **qt6ct** | GUI | qt6ct.conf | Qt6 theme switcher: style, font, icon theme |
| **Kvantum** | BOTH | kvantum.kvconfig, themes/*.svg | Qt theme engine: SVG themes that affect Qt apps + terminals |
| **GTK 3/4** | GUI | settings.ini, gtk.css | GTK theme: colors, font, icon theme, cursor |
| **matugen** | BOTH | config.toml, templates/* | Color engine: extracts colors from wallpaper → GTK, Qt, terminal, KDE |
| **wallust** | BOTH | templates/* | Color engine: extracts colors from wallpaper → terminal, waybar, rofi, etc. |
| **pywal** | BOTH | sequences, templates | Color engine: extracts colors from wallpaper → terminal, GTK, Qt |
| **firefox** | GUI | userChrome.css, mozilla.cfg | Browser: toolbar colors, new-tab page, about:config |
| **zathura** | GUI | zathurarc | PDF viewer: colors, font, keybinds |
| **spicetify** | GUI | config.ini, themes/* | Spotify client: theme, extensions, colors |
| **mpv** | GUI | mpv.conf | Media player: colors, quality, keybinds, OSC |
| **satty** | GUI | config.toml | Screenshot annotation: colors, tools, UI |
| **MangoHud** | BOTH | MangoHud.conf | Gaming overlay: GPU/CPU stats, colors, position |
| **uwsm** | GUI | configs | Universal Wayland Session Manager: session config |
| **pypr** | GUI | pyprland.toml | Hyprland plugin manager: plugins, toggles |
| **fontconfig** | BOTH | fonts.conf | Font configuration: fallback, aliases, rendering |
| **xsettingsd** | GUI | xsettingsd.conf | X settings daemon: font, DPI, cursor size |
| **xdg-desktop-portal** | GUI | hyprland-portals.conf | Portal config: screenshot, screen recording, file picker |
| **systemd** | GUI | user/*.service, user/*.timer | User services: autostart, timers |
| **vdirsyncer** | GUI | config | Calendar sync: CalDAV URLs, OAuth tokens |
| **khal** | GUI | config | Calendar viewer: colors, format, keybinds |

---

## Terminal vs GUI Count Per Repo

| Repo | Terminal Programs | GUI Programs | BOTH Programs | Terminal Files | GUI Files |
|------|------------------|--------------|---------------|---------------|-----------|
| end4 | foot, fish, zshrc, starship, mpv | quickshell, wlogout, hypridle, hyprlock, hyprpaper, fontconfig | matugen, Kvantum, hyprland | 10 files | 928 files |
| hyde | fish, zsh, starship, vim, btop, lsd | waybar, rofi, dunst, swaync, wlogout, swaylock, fastfetch, qt5/6ct, uwsm, pypr, nwg-look, satty, systemd, menus | wallust, hyprland, Kvantum, xsettingsd | 51 files | 152 files |
| ml4w | fish, zshrc, bashrc, vim, ohmyposh, btop | waybar, rofi, swaync, wlogout, qt6ct, nwg-dock, sidepad, walker, fastfetch | hyprland, matugen, quickshell, xsettingsd, gtk-3/4 | 22 files | 359 files |
| jakoolit | kitty, cava, ghostty, wezterm, btop | waybar, rofi, swaync, wlogout, quickshell, ags, qt5/6ct, fastfetch, swappy | wallust, hyprland, Kvantum | 205 files | 352 files |
| spelljinxer | kitty, btop, catnip, cava, nvim, ranger | waybar, rofi, hyprdots | hyprland, hyprpaper | 72 files | 177 files |
| snes19xx | kitty | quickshell, rofi, dunst, waybar, ags, fastfetch, zathura, mako, qt6ct, spicetify, vdirsyncer, khal, firefox | hyprland, kvantum, color-schemes | 9 files | 517 files |
| sameemul | alacritty | waybar, rofi, dunst, swaylock, fastfetch, zathura | hyprland | 10 files | 40 files |
| hyprconf | kitty, btop | waybar, rofi, dunst, fastfetch, qt5/6ct, Kvantum | hyprland | 8 files | 72 files |
| hyprflux | zshrc, tmux | — | — | 3 files | 0 files |
| lierb | — | — | pywal, hyprland | ~5 files | ~45 files |

---

## Key Finding

**End-4 is 99% GUI** (928/938 files are Quickshell). The actual terminal config is tiny: foot.ini (4K), fish (12K), zshrc.d (12K).

**JaKooLit is 60% GUI, 40% TERMINAL** — most balanced. Heavy on both Kitty themes (172 files) AND GUI configs.

**ML4W is 94% GUI** — custom ml4w/ ecosystem (41MB), waybar (372K), hypr (472K) dominate.

**Spelljinxer is 70% GUI** — hyprdots (208K) and waybar (204K) dominate, but has good terminal coverage (catnip, nvim, ranger, cava).

**Sameemul is 80% GUI** — minimal terminal config (just alacritty).

**HyprFlux is 100% TERMINAL** — just zshrc + tmux + installer script.

**lierb is 90% GUI** — pywal templates for GTK/Qt/terminal, minimal terminal config.
