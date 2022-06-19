local ls = require "luasnip"
local types = require "luasnip.util.types"
local silent = {silent = true}

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        active = {
            virt_text = { { "<-", "Error" } },
        }
    }
}

vim.keymap.set({'i', 's'}, '<c-k>', function ()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, silent)

-- Jump to the previous node
vim.keymap.set({'i', 's'}, '<c-j>', function ()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, silent)

-- select within a list of options, i.e choice nodes
vim.keymap.set("i", "<c-l>", function ()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)
