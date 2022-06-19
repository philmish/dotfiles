local Utils = require("phil.utils")
local nnoremap = Utils.nnoremap
local tnoremap = Utils.tnoremap
local silent = { silent = true }

-- Better Window movement with ctrl + vim-controlls
nnoremap('<C-h>', '<C-W>h', silent)
nnoremap('<C-j>', '<C-W>j', silent)
nnoremap('<C-l>', '<C-W>l', silent)
nnoremap('<C-k>', '<C-W>k', silent)

-- Splitting
nnoremap('<leader>vs', ':vsplit<CR>', {})

-- Use escape in terminal mode
tnoremap('<Esc>', '<C-\\><C-n>')
