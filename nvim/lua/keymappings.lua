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

-- Terminal Mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

-- Harpoon
vim.api.nvim_set_keymap('n', '<Leader>ha', ':lua require("harpoon.mark").add_file()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>hm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ha', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ht', ':vsplit<CR> :lua require("harpoon.term").gotoTerminal(1)<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>hf', ':lua require("harpoon.ui").nav_file(1)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>hv', ':vsplit<CR> :lua require("harpoon.term").sendCommand(1,1)<CR>', {noremap = true, silent = true})




