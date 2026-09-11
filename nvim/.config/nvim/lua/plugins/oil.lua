---@diagnostic disable: undefined-doc-name
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory with Oil" },
  },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    prompt_save_on_select_new_entry = true,
    skip_confirm_for_simple_edits = true,
    columns = {
      "icon",
    },
    keymaps = {
      ["q"] = "actions.close",
      ["<C-p>"] = "actions.preview",
    },
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = nil,
      win_options = {
        winblend = 0,
      },
    },
  },
}
