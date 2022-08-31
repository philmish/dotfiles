local Utils = require("phil.utils")
local nnoremap = Utils.nnoremap
local builtins = require('telescope.builtin')

-- find a file
nnoremap('<leader>pf', function ()
    builtins.find_files()
end)
-- enter a string to grep for
nnoremap('<leader>ps', function ()
    builtins.grep_string({ search = vim.fn.input"Grep for > "})
end)
nnoremap('<leader>vh', function ()
    builtins.help_tags()
end)
