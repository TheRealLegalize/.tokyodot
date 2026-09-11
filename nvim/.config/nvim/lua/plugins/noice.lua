return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#eb8700" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = "#eb8700" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { fg = "#c4e0ff" })

    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = false,
      },
      views = {
        cmdline_popup = {
          border = {
            style = "single",
          },
        },
        cmdline = {
          border = {
            style = "single",
          },
        },
      },
    })
  end,
}
