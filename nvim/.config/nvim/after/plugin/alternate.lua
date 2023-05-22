require("alternate-toggler").setup({
    alternates = {
        ["=="] = "!=",
        ["==="] = "!==",
        ["<"] = ">",
        [">"] = "<",
    }
})

vim.keymap.set(
    "n",
    "<leader>a",
    ":lua require('alternate-toggler').toggleAlternate()<CR>"
)
