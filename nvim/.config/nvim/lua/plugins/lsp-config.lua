return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "bashls", "pyright", "nim_langserver" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('bashls')
      vim.lsp.enable('pyright')
      vim.lsp.enable('nim_langserver')
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {silent = true, desc = 'Show code actions'})
    end
  },
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        server = {
        },
      }
    end
  }
}
