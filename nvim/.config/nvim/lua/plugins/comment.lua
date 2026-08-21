return {
  'numToStr/Comment.nvim',
  lazy = false,
  config = function()
    require('Comment').setup({
      pre_hook = function(ctx)
        local ft = vim.bo.filetype
        if vim.tbl_contains({ 'sh', 'bash', 'zsh', 'fish', 'hyprlang' }, ft) then
          return '#%s'
        end
      end,
    })

    vim.keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', { silent = true, desc = 'Toggle comment on current line' })
    vim.keymap.set('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', { silent = true, desc = 'Toggle comment on selection' })
  end,
}
