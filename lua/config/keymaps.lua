local keymap = vim.keymap

-- General keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Save file (Ctrl+S in insert and normal mode)
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("i", "<C-s>", "<ESC><cmd>w<CR>", { desc = "Save file" })

-- Select all (Ctrl+A)
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Save actions (Space + s)
keymap.set("n", "<leader>ss", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>sa", "<cmd>wa<CR>", { desc = "Save all files" })

keymap.set("n", "<leader>sf", function()
  -- Format then save
  vim.lsp.buf.format({ async = false })
  vim.cmd("w")
end, { desc = "Format and save" })

keymap.set("n", "<leader>sl", function()
  -- Run linter, fix issues, format, then save
  pcall(function()
    vim.cmd("EslintFixAll")
  end)
  vim.lsp.buf.format({ async = false })
  vim.cmd("w")
end, { desc = "Lint, format and save" })

keymap.set("n", "<leader>so", function()
  -- Organize imports (TypeScript/JavaScript)
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.organizeImports" },
      diagnostics = {},
    },
  })
  vim.defer_fn(function()
    vim.cmd("w")
  end, 100)
end, { desc = "Organize imports and save" })

-- Buffer management (like VS Code tabs)
keymap.set("n", "<leader>w", "<cmd>bd<CR>", { desc = "Close buffer" })
keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Move lines up and down (Alt+j/k like VS Code)
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Code folding (collapse/expand)
keymap.set("n", "<leader>fc", "zc", { desc = "Fold close (collapse)" })
keymap.set("n", "<leader>fo", "zo", { desc = "Fold open (expand)" })
keymap.set("n", "<leader>fa", "zA", { desc = "Fold toggle all levels" })
keymap.set("n", "<leader>fC", "zM", { desc = "Fold close all" })
keymap.set("n", "<leader>fO", "zR", { desc = "Fold open all" })

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Paste without yanking in visual mode
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Delete without yanking
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Quit (auto-saves all files before quitting)
keymap.set("n", "<C-q>", "<cmd>qa<CR>", { desc = "Quit all (auto-saves)" })
-- Note: <leader>q is reserved for session management (see persistence.lua)

-- LSP Navigation (easier alternatives to gd, gi, etc.)
keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "Show references" })
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
