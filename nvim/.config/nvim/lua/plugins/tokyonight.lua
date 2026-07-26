return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    on_colors = function(colors)
      colors.bg = "#1A1B26"
      colors.bg_statusline = colors.bg
    end,
  },
}
