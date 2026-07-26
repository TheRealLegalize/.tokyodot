return {
  "j-hui/fidget.nvim",
  opts = {
    progress = {
      display = {
        done_ttl = 3,
      },
    },
    notification = {
      window = {
        winblend = 0,
      },
    },
  },
  init = function()
    vim.lsp.handlers["$/progress"] = function() end
  end,
}
