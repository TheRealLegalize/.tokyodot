return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    'jvgrootveld/telescope-zoxide',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'jvgrootveld/telescope-zoxide',
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          zoxide = {
          },
        }
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("zoxide")
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { silent = true, desc = "Fuzzy find files in project" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { silent = true, desc = "Fuzzy find code in project files" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { silent = true, desc = "Fuzzy find in help tags" })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { silent = true, desc = "Fuzzy find keymaps" })
      vim.keymap.set('n', '<leader>fz', ':lua require("telescope").extensions.zoxide.list()<CR>', { silent = true, desc = "Fuzzy find recent directories" })
    end,
  }
}
