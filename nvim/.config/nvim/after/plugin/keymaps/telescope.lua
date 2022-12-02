local Utils = require("phil.utils")
local nnoremap = Utils.nnoremap
local builtins = require('telescope.builtin')

-- find a file
nnoremap('<leader>ff', function ()
    builtins.find_files()
end)
-- enter a string to grep for
nnoremap('<leader>ps', function ()
    builtins.grep_string({ search = vim.fn.input"Grep for > "})
end)

-- grep for string under cursor
nnoremap('<leader>pg', function ()
    builtins.grep_string()
end)

-- grep for git files
nnoremap('<leader>gf', function ()
    builtins.git_files()
end)

-- grep for git branches
nnoremap('<leader>gb', function ()
    builtins.git_branches()
end)

-- grep through git commits
nnoremap('<leader>gc', function ()
    builtins.git_commits()
end)

nnoremap('<leader>vh', function ()
    builtins.help_tags()
end)
