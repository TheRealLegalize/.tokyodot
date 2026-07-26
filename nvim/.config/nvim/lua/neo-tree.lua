return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    vim.keymap.set('n', '<leader>n', ':Neotree filesystem toggle left<CR>', {silent = true, desc = "Toggle neo-tree"})
    -- vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>', {silent = true, desc="Focus neo-tree"})
  end
} 

