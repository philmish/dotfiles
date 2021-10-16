local nvim_lsp = require('lspconfig')
nvim_lsp.tsserver.setup{
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
        root_dir = function() return vim.loop.cwd() end      -- run lsp for javascript in any directory
}

