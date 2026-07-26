return {
  'Folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    messages = {
      enabled = false,
      view = "mini", -- Компактный вид для сообщений в углу
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function ()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#89b4fa" }), -- Голубая обводка (Nord)
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = "#89b4fa" }),  -- Цвет заголовка
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { fg = "#cdd6f4" })
    })
  end
}
