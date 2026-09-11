---@diagnostic disable: undefined-doc-name
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    defer = function(ctx)
      return ctx.mode == "V" or ctx.mode == "<C-V>"
    end,
    win = {
      border = "single",
      padding = { 1, 2 },
      title_pos = "center",
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
