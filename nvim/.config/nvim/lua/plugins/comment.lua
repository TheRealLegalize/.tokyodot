return {
  'numToStr/Comment.nvim',
  lazy = false,
  config = function ()
    vim.keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', { silent = true, desc = 'Toggle comment on current line' })
    vim.keymap.set('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', { silent = true, desc = 'Toggle comment on current line' })
  end
}
