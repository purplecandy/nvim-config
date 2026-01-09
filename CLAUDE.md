# Context for Claude - Neovim Configuration

This document provides context about this Neovim configuration and the conversation that led to its creation.

## User Background

- **Coming from:** WebStorm (primary) and VS Code with VS Code Keymap
- **Experience level:** New to Neovim/Vim, familiar with modern IDEs
- **Primary work:** Web development (TypeScript/JavaScript)
- **Preferences:** Monaco font (size 16), familiar keyboard shortcuts, productivity-focused

## Main Goals

1. **Transition from IDE to Neovim** while maintaining familiar workflows
2. **Preserve muscle memory** from WebStorm/VS Code where possible
3. **Keep essential IDE features:**
   - LSP (TypeScript, JavaScript, HTML, CSS)
   - Auto-format on save (Prettier)
   - Auto-lint on save (ESLint)
   - Import cleanup
   - Code actions (auto-import, refactoring)
   - Git blame inline (like GitLens)
   - Symbol search
   - Code folding
   - Session management

4. **Simplify configuration** - avoid over-engineering, keep it practical

## Key Design Decisions

### Leader Key
- **Choice:** `Space` (standard in Neovim community)
- **Reasoning:** Easy to reach, doesn't conflict with anything

### Keybinding Philosophy
- **Hybrid approach:** Mix of Vim motions + familiar IDE shortcuts
- **VS Code-like shortcuts preserved where possible:**
  - `Ctrl+P` - Find files
  - `Ctrl+F` - Search in project
  - `Ctrl+S` - Save
  - `Ctrl+Q` - Quit
  - `Ctrl+/` - Toggle comment
  - `Tab`/`Shift+Tab` - Navigate buffers (like tabs)

### Important Adaptations Made

1. **Autocomplete trigger:** Changed from `Ctrl+Space` (conflicts with macOS) to `Ctrl+.` / `Cmd+.`
2. **Session management:** `Space+q` prefix for session operations, `Space+q+q` to quit and save
3. **Save actions:** `Space+s` prefix for all save variants (format, lint, organize imports)
4. **No window splitting shortcuts initially** - User doesn't use splits much, repurposed `Space+s` for save actions

### Font Configuration
- **Font:** Mononoki Nerd Font (Monaco-like with icon support)
- **Size:** 16
- **Note:** User originally wanted Monaco but needed Nerd Font for icons

### Plugin Choices

**Core plugins:**
- `lazy.nvim` - Modern plugin manager
- `catppuccin` - Color scheme (good defaults)
- `telescope.nvim` - Fuzzy finder (essential)
- `nvim-tree.lua` - File explorer
- `nvim-treesitter` - Syntax highlighting
- `mason.nvim` - LSP installer

**LSP & Code Quality:**
- `nvim-lspconfig` - LSP configuration
- `nvim-cmp` - Completion engine
- `conform.nvim` - Formatting (Prettier)
- `nvim-lint` - Linting (ESLint)

**Productivity:**
- `nvim-ufo` - Code folding (after initial issues, this plugin worked best)
- `gitsigns.nvim` - Git integration with inline blame
- `persistence.nvim` - Session management
- `Comment.nvim` - Easy commenting
- `which-key.nvim` - Keybinding helper

### Technical Challenges Solved

1. **Treesitter API changes:** Updated to use `master` branch for stability
2. **LSP deprecation warnings:** Updated to use modern `vim.lsp.config` API for Neovim 0.11+
3. **nvim-ufo fold indicators:** Simplified to ASCII characters (`v` and `>`) to avoid Unicode issues
4. **ESLint auto-fix errors:** Wrapped in `pcall()` to handle cases where ESLint isn't available
5. **Telescope preview errors:** Disabled treesitter highlighting in previewer

### Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point, sets leader before plugins load
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Plugin manager bootstrap
│   │   ├── options.lua        # General settings
│   │   └── keymaps.lua        # Key bindings
│   └── plugins/               # One file per plugin (Lazy.nvim convention)
│       ├── lspconfig.lua      # LSP setup for web dev
│       ├── mason.lua          # LSP installer config
│       ├── telescope.lua      # Fuzzy finder
│       ├── ufo.lua            # Code folding
│       ├── gitsigns.lua       # Git integration
│       └── ... (other plugins)
├── README.md                  # Installation & quick reference
├── FAQ.md                     # Common questions & answers
└── CLAUDE.md                  # This file
```

## User Preferences & Patterns

### Workflow Preferences
- **Doesn't use window splits much** - mostly works with buffers (tabs)
- **Heavily uses code actions** - auto-import, organize imports, quick fixes
- **Values inline feedback** - git blame, diagnostics, fold indicators
- **Prefers explicit actions** - multiple save variants (`Space+s+f`, `Space+s+l`, etc.)

### Learning Style
- **Practical learner** - wants to understand "why" behind features
- **Asks clarifying questions** - relative line numbers, fold levels, etc.
- **Compares to familiar tools** - "In WebStorm/VS Code, this was..."
- **Appreciates visual feedback** - wanted fold indicators, git blame inline

### Things User Asked About
- Session management (restore files on open)
- Code folding (took several attempts to get right)
- Git blame inline (like GitLens)
- Symbol search (Cmd+T in WebStorm)
- Code actions (bulb icon in VS Code)
- Documentation hover (K key)
- Jump history (browser-like back/forward)
- Autocomplete trigger (manual)
- Vim motions (w, e, b, ge)

## Important Notes for Future Sessions

1. **Always check for mode conflicts** - User occasionally gets stuck in unexpected modes
2. **Prefer terminal-compatible shortcuts** - User is on macOS, some Cmd shortcuts don't work in terminal
3. **Keep FAQ.md updated** - User finds it very helpful
4. **Test font/icon issues** - Nerd Fonts are required for proper icon display
5. **Session management is important** - User wants files to persist across sessions
6. **Relative line numbers enabled** - User kept them after explanation of benefits

## Repository Structure

- **Public repository:** https://github.com/purplecandy/nvim-config
- **Purpose:** Backup config for easy restoration on remote machines
- **Safe to share:** No sensitive data in Neovim configs

## Commit Philosophy

- Descriptive commit messages
- Include "Generated with Claude Code" footer
- Co-authored with Claude Sonnet 4.5
- Atomic commits for related changes

## Next Steps / Future Enhancements

Potential areas user might want to explore:
- GUI Neovim (Neovide) for better Cmd key support
- Debugger integration (nvim-dap)
- More advanced Vim motions and text objects
- Custom snippets for common patterns
- Git integration beyond blame (diffview, fugitive)

## Key Quotes / Insights

> "I don't do lot of splitting windows at the moment. I was thinking if we can remove the S bindings to something else..."

This shows user's practical approach - remove unused features, repurpose shortcuts for frequently-used operations.

> "Sometimes I accidentally run into some mode where the SPACE is there way to know / escape / reset?"

User is new to modal editing but learning. Needs clear escape mechanisms and mode indicators.

> "Can you write a CLAUDE.md file in this repo so you remember our conversation and the intent of this nvim thing?"

User values context and future maintainability. Wants AI assistants to understand the "why" not just the "what".

---

## For Future Claude Sessions

When helping with this config:

1. **Respect the established patterns** - Don't over-engineer or add unnecessary complexity
2. **Maintain IDE-like feel** - User is transitioning from WebStorm/VS Code
3. **Provide explanations** - User wants to understand, not just copy/paste
4. **Test in terminal** - Most shortcuts should work in terminal Neovim
5. **Update documentation** - Keep README.md and FAQ.md in sync with changes
6. **Commit thoughtfully** - User values clean git history

## Session Summary

- **Date:** January 9-10, 2025
- **Duration:** Extended configuration session
- **Model:** Claude Sonnet 4.5
- **Outcome:** Fully functional Neovim setup with 24 config files, comprehensive documentation
- **User satisfaction:** Successfully transitioned key workflows from WebStorm/VS Code

---

*This document should be updated when significant changes are made to the configuration or when new preferences/patterns emerge.*

🤖 Generated with Claude Code in collaboration with purplecandy
