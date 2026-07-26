vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set undofile")
vim.cmd("set undodir=~/.local/share/nvim/undo")
vim.cmd("set undolevels=1000")
vim.cmd("set undoreload=10000")
vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = false
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars:append({ eob = " " })
vim.opt.termguicolors = true

vim.keymap.set('n', '<leader>cca', 'ggVG"+y', {silent = true, desc = 'Copy all'})
vim.keymap.set("n", "<Leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<Leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<Leader>wq", ":wq<CR>", { desc = "Save and quit" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })
vim.opt.clipboard = "unnamedplus"

