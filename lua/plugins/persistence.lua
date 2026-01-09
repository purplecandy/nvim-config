return {
  "folke/persistence.nvim",
  event = "VimEnter",
  opts = {
    options = { "buffers", "curdir", "tabpages", "winsize" },
    pre_save = function()
      -- Close NvimTree before saving session
      vim.cmd("silent! NvimTreeClose")
    end,
  },
  config = function(_, opts)
    local persistence = require("persistence")
    persistence.setup(opts)

    -- Auto-save session on quit
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        persistence.save()
      end,
    })

    -- Auto-restore session when opening nvim in a directory with a session
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Only restore if nvim was started with no arguments and a session exists
        if vim.fn.argc() == 0 then
          vim.defer_fn(function()
            persistence.load()
          end, 0)
        end
      end,
      nested = true,
    })

    -- Keymaps - Space + q for session management
    local keymap = vim.keymap

    keymap.set("n", "<leader>qq", function()
      -- Save all modified files first
      vim.cmd("silent! wall")
      -- Save session
      persistence.save()
      -- Quit all
      vim.cmd("qa!")
    end, { desc = "Quit and save session" })

    keymap.set("n", "<leader>qs", function()
      persistence.load()
    end, { desc = "Restore session for current directory" })

    keymap.set("n", "<leader>ql", function()
      persistence.load({ last = true })
    end, { desc = "Restore last session" })

    keymap.set("n", "<leader>qd", function()
      persistence.stop()
    end, { desc = "Don't save current session" })
  end,
}
