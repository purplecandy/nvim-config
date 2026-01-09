return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup({
      -- LHS of toggle mappings in NORMAL mode
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      -- LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        line = "gc",
        block = "gb",
      },
    })

    -- Add Ctrl+/ mapping like VS Code
    vim.keymap.set("n", "<C-_>", "gcc", { desc = "Toggle comment", remap = true })
    vim.keymap.set("v", "<C-_>", "gc", { desc = "Toggle comment", remap = true })
  end,
}
