---
name: dotfile-repo-evaluator
description: |
  Evaluate and grade dotfile GitHub repos systematically. Clone repos, identify
  configured programs, compare configs against upstream defaults, assign letter grades,
  produce compatibility matrices, and extract real screenshots from repo assets.
  ALWAYS invoke when user asks to evaluate dotfile repos, compare dotfile setups,
  find the best dotfile configs, or audit a dotfile repository.
tools:
  - Bash(*)
  - Glob(*)
  - read_file(*)
  - write_file(*)
  - web_search(*)
  - web_fetch(*)
---

# Dotfile Repo Evaluator

Systematic evaluation of dotfile GitHub repositories. Clone, catalog, compare, grade.

## Workflow

### Phase 1: Discovery and Clone

1. **Search GitHub** for repos matching the user's criteria:
   - Use `topic:hyprland-dotfiles` or `topic:dotfiles` with `sort:stars`
   - Filter out standalone applications (Quickshell apps, Go binaries, PKGBUILDs)
   - Filter out wallpaper-only repos, installer-only repos, config UI repos
   - Keep only repos that contain actual config files in `.config/` or dotfiles

2. **Clone all target repos** into a temporary workspace:
   ```bash
   WORKSPACE="$HOME/.cache/dotfile-eval/$(date +%Y%m%d_%H%M%S)"
   mkdir -p "$WORKSPACE/repos"
   cd "$WORKSPACE/repos"
   git clone --depth=1 "$REPO_URL" "$SLUG" 2>&1
   ```

### Phase 2: Programmatic File Discovery

For each cloned repo, run this analysis:

```bash
REPO_DIR="$WORKSPACE/repos/$SLUG"

# Find all config directories (the ones that matter)
# Common locations: .config/, dots/.config/, Configs/.config/, config/
DOTS_DIR=""
for d in "$REPO_DIR/dots/.config" "$REPO_DIR/.config" "$REPO_DIR/Configs/.config" "$REPO_DIR/config/.config" "$REPO_DIR/config"; do
    if [ -d "$d" ]; then
        DOTS_DIR="$d"
        break
    fi
done

if [ -z "$DOTS_DIR" ]; then
    echo "SKIP: $SLUG — no config directory found"
    continue
fi

# Discover all configured programs (directory names under .config/)
PROGRAMS=$(find "$DOTS_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)

# For each program, count files and total size
for prog in $PROGRAMS; do
    FILE_COUNT=$(find "$DOTS_DIR/$prog" -type f | wc -l)
    TOTAL_SIZE=$(du -sh "$DOTS_DIR/$prog" 2>/dev/null | cut -f1)
    # Get file types
    FILE_TYPES=$(find "$DOTS_DIR/$prog" -type f -exec basename {} \; | sort -u | tr '\n' ', ')
    echo "$SLUG | $prog | $FILE_COUNT files | $TOTAL_SIZE | $FILE_TYPES"
done
```

### Phase 3: Config Quality Grading

For EACH program found in EACH repo, grade it:

#### Grading Rubric

| Grade | Criteria |
|-------|----------|
| **S** | Exceptional: custom scripts, modular config, comprehensive key coverage (>70%), unique features, documentation |
| **A** | Excellent: well-structured, good key coverage (50-70%), custom themes, multiple variants |
| **B** | Good: functional config, decent coverage (30-50%), some customization |
| **C** | Average: basic config, minimal coverage (10-30%), mostly defaults |
| **D** | Poor: nearly default, almost no customization (<10%), broken or incomplete |
| **F** | Missing: program directory exists but config is empty or just a stub |

#### How to Grade (Compare Against Source Defaults)

For each config file:

1. **Find the default config** from upstream source:
   - Kitty: `kitty --dump-config` or https://sw.kovidgoyal.net/kitty/conf/
   - Hyprland: https://wiki.hyprland.org/Configuring/
   - Waybar: https://github.com/Alexays/Waybar/wiki/Configuration
   - Rofi: `rofi -dump-config` or https://github.com/davatorium/rofi
   - Dunst: `dunst --print-config` or https://dunst-project.org/
   - Neovim: defaults are minimal — any config is customization
   - fastfetch: `fastfetch --print-config` or https://github.com/fastfetch-cli/fastfetch
   - btop: `btop --help` for defaults or https://github.com/aristocratos/btop
   - foot: https://codeberg.org/dnkl/foot#configuration
   - Ghostty: https://ghostty.org/docs/config/reference
   - zshrc/bashrc/fish: no defaults — grade by features present

2. **Count key coverage**:
   ```bash
   # Example: Kitty has ~80 configurable keys in its default dump
   DEFAULT_KEYS=$(kitty --dump-config 2>/dev/null | grep -c "^[a-z]")
   CUSTOM_KEYS=$(grep -c "^[a-z]" ~/.config/kitty/kitty.conf 2>/dev/null)
   COVERAGE=$((CUSTOM_KEYS * 100 / DEFAULT_KEYS))
   ```

3. **Check for quality indicators**:
   - ✅ Custom keybinds (not just defaults)
   - ✅ Multiple themes/variants
   - ✅ Modular config (sourced files, includes)
   - ✅ Custom scripts (launchers, toggles, utilities)
   - ✅ Color theming (consistent palette)
   - ✅ Comments/documentation
   - ✅ Performance tuning
   - ❌ Empty config or just defaults
   - ❌ Broken syntax
   - ❌ Hardcoded paths that won't work elsewhere

4. **Assign grade** based on rubric above.

#### Example Grading Output

```
end4/kitty:
  Files: 4 (kitty.conf, scroll_mark.py, search.py, kitty-theme.conf)
  Lines: 120 total
  Key coverage: 45/80 defaults overridden (56%)
  Features: custom keybinds ✓, python kittens ✓, matugen theme sync ✓, search kitten ✓
  Modular: ✓ (includes kitty-theme.conf from matugen)
  Grade: A

ml4w/kitty:
  Files: 1 (kitty.conf)
  Lines: 35 total
  Key coverage: 18/80 defaults overridden (22%)
  Features: font ✓, padding ✓, matugen include ✓
  Modular: ✓ (includes matugen-generated theme)
  Grade: B

sameemul/kitty:
  Files: 0 — not configured
  Grade: F (not present)
```

### Phase 4: Cross-Repo Comparison

After grading all repos, build a comparison matrix:

```
Program    | end4  | hyde  | ml4w  | jakoo | spell | snes  | same  | hyprconf | hyprflux | lierb
-----------+-------+-------+-------+-------+-------+-------+-------+----------+----------+------
kitty      | A     | B     | B     | A     | B     | B     | F     | F        | F        | F
ghostty    | F     | F     | F     | A     | F     | F     | F     | F        | F        | F
foot       | B     | F     | F     | F     | F     | F     | F     | F        | F        | F
hyprland   | S     | A     | A     | A     | B     | B     | B     | A        | B        | C
waybar     | F     | A     | A     | A     | A     | F     | A     | A        | F        | F
rofi       | F     | B     | B     | B     | A     | A     | A     | F        | F        | F
dunst      | F     | B     | F     | F     | F     | F     | B     | B        | F        | F
fastfetch  | F     | A     | B     | A     | B     | F     | B     | B        | F        | F
btop       | F     | F     | B     | A     | A     | F     | F     | B        | F        | F
zshrc      | B     | F     | A     | F     | A     | A     | F     | F        | F        | F
fish       | A     | A     | B     | F     | F     | F     | F     | F        | F        | F
hyprlock   | B     | A     | B     | A     | F     | A     | B     | B        | B        | F
```

### Phase 5: Screenshot Extraction

For each repo, find and list REAL screenshot URLs:

```bash
# Check common screenshot locations
for path in \
    "$REPO_DIR/README.md" \
    "$REPO_DIR/.github/README.md" \
    "$REPO_DIR/docs/README.md"; do
    if [ -f "$path" ]; then
        # Extract image URLs from markdown
        grep -oE '!\[.*\]\(.*\)' "$path" | grep -oE 'https?://[^)]+' | head -5
        # Extract raw GitHub image URLs
        grep -oE '\[.*\]: .*' "$path" | grep -oE 'https?://[^ ]+' | head -5
    fi
done

# Check common asset directories
for dir in \
    "$REPO_DIR/assets" \
    "$REPO_DIR/.github/assets" \
    "$REPO_DIR/screenshots" \
    "$REPO_DIR/Preview" \
    "$REPO_DIR/media" \
    "$REPO_DIR/images"; do
    if [ -d "$dir" ]; then
        find "$dir" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" \) 2>/dev/null | while read -r img; do
            # Convert to raw GitHub URL
            REL="${img#$REPO_DIR/}"
            SLUG="$(basename "$REPO_DIR")"
            OWNER="$(basename "$(dirname "$REPO_DIR")")"
            echo "https://raw.githubusercontent.com/$OWNER/$SLUG/main/$REL"
        done
    fi
done
```

### Phase 6: Output Format

Produce a comprehensive markdown report:

```markdown
# Dotfile Repo Evaluation Report

## Repos Evaluated
| # | Repo | Stars | Type | Bar | Launcher | Lock | Terminal | Shell | Colors |
|---|------|-------|------|-----|----------|------|----------|-------|--------|

## Config Quality Grades
(program-by-program grade matrix)

## Detailed Analysis Per Repo
### end-4/dots-hyprland (13,800★)
**Screenshots:** [link1](url), [link2](url)
**Config Grades:**
| Program | Files | Lines | Key Coverage | Features | Grade |
|---------|-------|-------|-------------|----------|-------|
| hyprland | 15 | 340 | 72% | modular, custom scripts, animations | S |
| kitty | 4 | 120 | 56% | kittens, matugen sync, search | A |
| ... | ... | ... | ... | ... | ... |

## Recommendations
(best repos per category, best overall, best for specific use cases)
```

## Key Principles

1. **Clone first, analyze second.** Never grade from README descriptions alone.
2. **Count actual files.** Don't trust star counts — some repos are inflated with assets.
3. **Compare against upstream defaults.** A config that changes 5 keys out of 80 is worse than one that changes 40 out of 80.
4. **Check if config is functional.** Broken syntax = automatic D or F grade.
5. **Note what's unique.** GLSL shaders, custom scripts, modular structure, multiple themes — these boost grades.
6. **Identify compatibility groups.** Repos using the same bar/launcher/lockscreen stack can swap configs.
7. **Extract real screenshots.** Always use the repo's own images, never generate mock previews.
