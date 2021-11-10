-- Key Mappings
require('plugins')

vim.api.nvim_set_keymap('n', '<space>', '<NOP>', {noremap = true, silent = true})

vim.g.mapleader = ' '

-- Base
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>vs', ':vsplit<CR>', {noremap = true, silent = true})

-- NvimTree
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})


-- Better Window movement with ctrl + vim-controlls
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { silent = true })

-- Terminal Mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

-- Fugitive
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Git status<CR>', {noremap = true, silent = true})

-- Harpoon
vim.api.nvim_set_keymap('n', '<Leader>ha', ':lua require("harpoon.mark").add_file()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>hm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>hc', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ht', ':vsplit<CR> :lua require("harpoon.term").gotoTerminal(1)<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>h2', ':lua require("harpoon.ui").nav_file(1)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>h3', ':lua require("harpoon.ui").nav_file(1)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>hs1', ':vsplit<CR> :lua require("harpoon.term").sendCommand(1,1)<CR>', {noremap = true, silent = true})

-- LSP Saga
vim.api.nvim_set_keymap('n', '<Leader>sa', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rn', ':Lspsaga code_action rename<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ft', ':Lspsaga open_floaterm<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>sd', ':lua require("lspsaga.provider").preview_definition()', {noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})

-- Treesitter
vim.api.nvim_set_keymap('n', '<Leader>tsp', ':TSPlaygroundToggle<CR>', {noremap = true, silent = true})





