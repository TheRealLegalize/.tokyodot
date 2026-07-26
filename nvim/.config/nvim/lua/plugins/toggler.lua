return {
  'nguyenvukhang/nvim-toggler',
  config = function()
    require('nvim-toggler').setup({
      inverses = {
        ['vim'] = 'emacs'
      },
      remove_default_keybinds = true,
      remove_default_inverses = false,
      autoselect_longest_match = false,
      vim.keymap.set({ 'n', 'v' }, '<leader>tt', require('nvim-toggler').toggle)
    })
  end
}

