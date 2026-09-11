local my_colors = {
  base     = "#181818",
  mantle   = "#161616",
  crust    = "#2d2d2d",
  surface0 = "#2f2f2f",
  surface1 = "#3b434d",
  surface2 = "#4f565f",
  text     = "#c4e0ff",
  subtext0 = "#9db3cc",
  subtext1 = "#9db3cc",
  overlay0 = "#768699",
  red      = "#eb0000",
  green    = "#00eb07",
  yellow   = "#eb8700",
  blue     = "#006ceb",
  purple   = "#7900eb",
  cyan     = "#00beeb",

  bred     = "#ff1414",
  bgreen   = "#18ff1f",
  byellow  = "#ff9f14",
  bblue    = "#147eff",
  bpurple  = "#9514ff",
  bcyan    = "#14d2ff",
}

my_colors.accent = my_colors.yellow
my_colors.inactive = my_colors.surface1

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    on_colors = function(c)
      -- Фоны
      c.bg            = my_colors.base
      c.bg_dark       = my_colors.mantle
      c.bg_float      = my_colors.base
      c.bg_popup      = my_colors.mantle
      c.bg_sidebar    = my_colors.mantle
      c.bg_statusline = my_colors.base
      c.bg_highlight  = my_colors.surface0

      -- Границы
      c.border           = my_colors.crust
      c.border_highlight = my_colors.accent

      -- Текст
      c.fg         = my_colors.text
      c.fg_dark    = my_colors.subtext0
      c.fg_float   = my_colors.text
      c.fg_sidebar = my_colors.subtext0
      c.fg_gutter  = my_colors.overlay0
      c.comment    = my_colors.overlay0

      -- Акценты
      c.blue    = my_colors.bblue
      c.blue1   = my_colors.bblue
      c.blue2   = my_colors.bcyan
      c.cyan    = my_colors.cyan
      c.green   = my_colors.green
      c.green1  = my_colors.bgreen
      c.orange  = my_colors.yellow
      c.purple  = my_colors.purple
      c.magenta = my_colors.bpurple
      c.red     = my_colors.red
      c.red1    = my_colors.bred
      c.yellow  = my_colors.byellow

      c.git = {
        add    = my_colors.green,
        change = my_colors.yellow,
        delete = my_colors.red,
      }
      c.terminal_black = my_colors.crust
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}
