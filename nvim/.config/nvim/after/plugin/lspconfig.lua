local Utils = require "phil.utils"
local nnoremap = Utils.nnoremap
local silent = { silent = true }
local homedir = vim.fn.expand("~/")
-- Lua lsp vars

local sumenko_root = homedir .. 'lua-language-server'
local sumenko_binary = sumenko_root .. '/bin/lua-language-server'


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function (client,bufnr)

	nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
	nnoremap("gd", "<cmd>Telescope lsp_definitions<CR>", silent)
	nnoremap("gr", "<cmd>Telescope lsp_references<CR>", silent)
    nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
    nnoremap("<leader>di", "<cmd>Telescope diagnostics<CR>", silent)
    nnoremap("<leader>td", "<cmd>Telescope lsp_type_definitions<CR>", silent)
    nnoremap("<leader>fmtc", "<cmd>lua vim.lsp.buf.formatting()<CR>", silent)

    nnoremap("<leader>cf", "<cmd>lua require'neogen'.generate({ type = 'func'})<CR>", silent)
    -- if the lsp provides formatting, format on file write
    if client.server_capabilities.document_formatting then
        vim.cmd([[
            augroup formatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
            augroup END
        ]])
    end
end

require('lspconfig')['pyright'].setup {
	capabilities = capabilities,
	on_attach = on_attach
}

require('lspconfig')['tsserver'].setup {
	capabilities = capabilities,
	on_attach = on_attach
}

require('lspconfig')['bashls'].setup {
	capabilities = capabilities,
	on_attach = on_attach
}

require('lspconfig')['gopls'].setup {
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { sumenko_binary, "-E", sumenko_root .. "/main.lua"},
    settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
    },
}

