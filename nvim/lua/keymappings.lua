-- Key Mappings
require('plugins')

vim.api.nvim_set_keymap('n', '<space>', '<NOP>', {noremap = true, silent = true})

vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})

-- Better Window movement with ctrl + vim-controlls
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { silent = true })
