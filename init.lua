-- Set leader key BEFORE loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim plugin manager
require("config.lazy")

-- Load core configuration
require("config.options")
require("config.keymaps")
