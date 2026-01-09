return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
        -- Disable treesitter highlighting in previewer to avoid errors
        preview = {
          treesitter = false,
        },
      },
    })

    telescope.load_extension("fzf")

    -- Keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in project" })
    keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { desc = "Find string in project" })
    keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find word under cursor" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })

    -- Symbol search (like CMD+T in WebStorm/VS Code)
    keymap.set("n", "<leader>t", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols in current file" })
    keymap.set("n", "<leader>T", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Find symbols in workspace" })

    -- Command Palette - Shows all keymaps in Telescope UI
    keymap.set("n", "<leader><leader>", "<cmd>Telescope keymaps<cr>", { desc = "Command palette (keymaps)" })
    keymap.set("n", "<C-S-p>", "<cmd>Telescope keymaps<cr>", { desc = "Command palette" })

    -- Other useful pickers
    keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Find commands" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })

    -- Git pickers (using Space+g with non-conflicting keys)
    keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status (changed files)" })
    keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
    keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
    keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Git files (tracked)" })

    -- Cheatsheet picker
    keymap.set("n", "<leader>?", function()
      require("telescope.builtin").keymaps({
        prompt_title = "🎓 Keybindings Cheatsheet",
      })
    end, { desc = "Cheatsheet (keybindings)" })
  end,
}
