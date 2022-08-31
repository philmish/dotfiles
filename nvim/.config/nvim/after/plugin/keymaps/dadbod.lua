local Utils = require("phil.utils")
local nnoremap = Utils.nnoremap
local silent = { silent = true }

-- Open dadbod ui
nnoremap('<Leader>du', ':DBUIToggle<CR>', silent)
nnoremap('<Leader>df', ':DBUIFindBuffer<CR>', silent)
nnoremap('<Leader>dr', ':DBUIRenameBuffer<CR>', silent)
-- Replay data returned from last query
nnoremap('<Leader>dl', ':DBUILastQueryInfo<CR>', silent)

