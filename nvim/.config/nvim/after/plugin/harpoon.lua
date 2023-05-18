require("harpoon").setup({
    global_settings = {
        enter_on_sendcmd = true
    },
    projects = {
        ["$HOME/code/repos/dotfiles"] = {
            mark = {
                marks = {
                    "nvim/.config/nvim/init.lua",
                }
            }
        }
    }
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local silent = {silent = true}

vim.keymap.set("n", "<leader>ha", mark.add_file, silent)
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, silent)

-- Open files 1 - 4
vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)
