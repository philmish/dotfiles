local silent = { silent = true }
local Utils = require("phil.utils")
local nnoremap = Utils.nnoremap

nnoremap('<Leader>ha', ':lua require("harpoon.mark").add_file()<CR>', silent)
nnoremap('<Leader>hm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', silent)
nnoremap('<Leader>hc', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', silent)

-- Open file 1 to 3
nnoremap('<Leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>', silent)
nnoremap('<Leader>h2', ':lua require("harpoon.ui").nav_file(1)<CR>', silent)
nnoremap('<Leader>h3', ':lua require("harpoon.ui").nav_file(1)<CR>', silent)

--nnoremap ('<Leader>hs1', ':vsplit<CR> :lua require("harpoon.term").sendCommand(1,1)<CR>', silent)
--nnoremap('<Leader>ht', ':vsplit<CR> :lua require("harpoon.term").gotoTerminal(1)<CR>', silent)


