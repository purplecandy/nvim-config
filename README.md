# Neovim Configuration

My personal Neovim configuration for web development, optimized for TypeScript/JavaScript.

## Features

- 🎨 Catppuccin color scheme
- 📦 Lazy.nvim plugin manager
- 🔍 Telescope fuzzy finder
- 🌳 Nvim-tree file explorer
- 💡 LSP support (TypeScript, JavaScript, HTML, CSS, etc.)
- ✨ Auto-completion with nvim-cmp
- 🎯 Code folding with nvim-ufo
- 📝 Auto-format on save (Prettier)
- 🔧 Auto-lint on save (ESLint)
- 📜 Git integration with inline blame
- 💾 Session management

## Installation

### Prerequisites

```bash
# Install Neovim (0.10+)
brew install neovim

# Install Nerd Font
brew tap homebrew/cask-fonts
brew install font-mononoki-nerd-font

# Set your terminal to use Mononoki Nerd Font at size 16
```

### Setup

1. Clone this config:
```bash
git clone <your-repo-url> ~/.config/nvim
```

2. Open Neovim:
```bash
nvim
```

3. Plugins will auto-install via Lazy.nvim. Wait for installation to complete.

4. Restart Neovim.

5. Install LSP servers and tools:
```vim
:Mason
```

## Key Bindings

### General
- `Space` - Leader key
- `Ctrl+S` - Save file
- `Ctrl+Q` - Quit
- `Space+q+q` - Quit and save session

### Navigation
- `Ctrl+P` - Find files
- `Ctrl+F` - Search in project
- `Space+t` - Find symbols
- `Space+e+e` - Toggle file tree
- `gd` - Go to definition
- `Tab` / `Shift+Tab` - Next/previous buffer

### Save Actions
- `Space+s+s` - Save
- `Space+s+f` - Format and save
- `Space+s+l` - Lint, format and save
- `Space+s+o` - Organize imports and save

### Code Folding
- `Space+f+c` - Collapse fold
- `Space+f+o` - Open fold
- `Space+f+a` - Toggle fold
- `Space+f+C` - Collapse all
- `Space+f+O` - Open all

### Git
- `Space+h+B` - Toggle inline git blame
- `Space+h+b` - Show full blame
- `]c` / `[c` - Next/previous git hunk

### Editing
- `Ctrl+/` - Toggle comment
- `Ctrl+Space` - Trigger autocomplete
- `u` - Undo
- `Ctrl+R` - Redo

## Customization

Edit files in `~/.config/nvim/lua/`:
- `config/options.lua` - General settings
- `config/keymaps.lua` - Key bindings
- `plugins/` - Plugin configurations

## Updating

```vim
:Lazy sync
```

## Troubleshooting

- **LSP not working?** Run `:LspInfo` and `:Mason` to check server status
- **Treesitter errors?** Run `:TSUpdate`
- **Icons not showing?** Make sure you're using a Nerd Font

---

🤖 Generated with Claude Code
