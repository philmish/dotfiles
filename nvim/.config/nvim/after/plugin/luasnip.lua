local ls = require("luasnip")
local silent = {silent = true}

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        active = {
            virt_text = {{ "<-", "Error" }},
        }
    }
}

vim.keymap.set({"i", "s"}, "<C-k>", function ()
   if ls.expand_or_jumpable() then
       ls.expand_or_jump()
   end
end, silent)

vim.keymap.set({"i", "s"}, "<C-j>", function ()
   if ls.jumpable(-1) then
       ls.jump(-1)
   end
end, silent)

-- Select choice nodes
vim.keymap.set({"i", "s"}, "<C-l>", function ()
   if ls.choice_active() then
       ls.change_choice(1)
   end
end)

