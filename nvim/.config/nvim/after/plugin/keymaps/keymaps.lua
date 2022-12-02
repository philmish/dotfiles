local Utils = require("phil.utils")
local nnoremap = Utils.nnoremap
local tnoremap = Utils.tnoremap
local vnoremap = Utils.vnoremap
local silent = { silent = true }

-- Better Window movement with ctrl + vim-controlls
nnoremap('<C-h>', '<C-W>h', silent)
nnoremap('<C-j>', '<C-W>j', silent)
nnoremap('<C-l>', '<C-W>l', silent)
nnoremap('<C-k>', '<C-W>k', silent)

-- LSP Code actions
nnoremap('<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

-- Splitting
nnoremap('<leader>vs', ':vsplit<CR>', {})

-- Untoggle highlight search
nnoremap('<leader>hl', ':set hlsearch!<CR>')

-- Move marked line in visual mode
-- down
vnoremap("J", ":m '>+1<CR>gv=gv")
-- up
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Use escape in terminal mode
tnoremap('<Esc>', '<C-\\><C-n>')

-- Fugitive
--nnoremap('<leader>g', ':Git<CR>')

-- NvimTree
nnoremap('<leader>e', ':NvimTreeToggle<CR>')

-- Undotree
nnoremap('<leader>u', ':UndotreeToggle<CR>')

