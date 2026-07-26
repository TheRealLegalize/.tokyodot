return {
  'rcarriga/nvim-notify',
  config = function()
    require("notify").setup({
      max_width = function()
        return math.floor(vim.o.columns * 0.3) -- 30% от ширины экрана
      end,
      max_height = function()
        return math.floor(vim.o.lines * 0.2) -- 20% от высоты экрана
      end,
      background_colour = "#000000"
    })
  end
}
