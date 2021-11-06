-- Options

local tabs = 4

vim.o.exrc=true
vim.o.tabstop=tabs
vim.o.softtabstop=tabs
vim.o.expandtab=true
vim.o.smartindent=true
vim.o.relativenumber=true
vim.o.hidden=true
vim.o.nu=true
vim.o.wrap=false
vim.o.smartcase=true
vim.o.swapfile=false
vim.o.backup=false
vim.o.undodir=vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile=true
vim.o.incsearch=true
vim.o.termguicolors=true
vim.o.scrolloff=8
vim.o.showmode=false
vim.o.cmdheight=2
vim.o.laststatus=2
vim.o.modifiable=true
vim.o.splitright=true

vim.cmd('colorscheme gruvbox')
