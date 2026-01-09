-- General settings
local opt = vim.opt

-- Font settings (works in GUI neovim like neovide or nvim-qt)
-- Use a Nerd Font for proper icon support
opt.guifont = "MononokiNerdFont:h16"
-- Alternative options:
-- opt.guifont = "MesloLGSNerdFont:h16"
-- opt.guifont = "JetBrainsMonoNerdFont:h16"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable swapfile
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Note: Code folding is configured in plugins/ufo.lua

-- Auto-save all modified buffers when quitting (like VS Code/WebStorm)
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.cmd("silent! wall") -- save all modified buffers
  end,
})
