local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "lua_ls",
    "rust_analyzer",
    "intelephense",
    "gopls",
    "bashls",
    "clangd",
    "dockerls",
    "pyright",
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "fmt", function() vim.lsp.buf.formatting() end, opts)
    
end)
lsp.setup()

-- Completion

local cmp = require('cmp')
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({select = false}),
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Navigate between luasnip placeholdern
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
    }
})
