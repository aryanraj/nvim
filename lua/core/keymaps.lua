vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.scrolloff = 5
vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'auto:4'

-- set show numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- use spaces for tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>s', ':split<CR>')
vim.keymap.set('n', '<leader>v', ':vsplit<CR>')

-- move topleft window to different positions
vim.keymap.set('n', '<leader>th', '<C-w>t<C-w>H')
vim.keymap.set('n', '<leader>tj', '<C-w>t<C-w>J')
vim.keymap.set('n', '<leader>tk', '<C-w>t<C-w>K')
vim.keymap.set('n', '<leader>tl', '<C-w>t<C-w>L')

-- Sync * register with + register
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("x", "<leader>p", "\"_dP")

