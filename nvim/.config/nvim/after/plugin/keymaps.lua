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

nnoremap('<leader>h', ':set hlsearch!<CR>')

-- NvimTree
nnoremap('<leader>e', ':NvimTreeToggle<CR>')

-- Telescope
nnoremap('<leader>ff', ':Telescope find_files<CR>')


-- Harpoon
nnoremap('<Leader>ha', ':lua require("harpoon.mark").add_file()<CR>', silent)
nnoremap('<Leader>hm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', silent)
nnoremap('<Leader>hc', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', silent)
nnoremap('<Leader>ht', ':vsplit<CR> :lua require("harpoon.term").gotoTerminal(1)<CR>', silent)

nnoremap('<Leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>', silent)
nnoremap('<Leader>h2', ':lua require("harpoon.ui").nav_file(1)<CR>', silent)
nnoremap('<Leader>h3', ':lua require("harpoon.ui").nav_file(1)<CR>', silent)
nnoremap ('<Leader>hs1', ':vsplit<CR> :lua require("harpoon.term").sendCommand(1,1)<CR>', silent)
