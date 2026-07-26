---@diagnostic disable: undefined-doc-name
return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  lazy = false,
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      prompt_save_on_select_new_entry = true,
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      skip_confirm_for_simple_edits = true,
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
    })
  end
}
