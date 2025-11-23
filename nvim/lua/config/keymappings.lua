-- open file explorer
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { noremap = true })

-- open docs for symbol in float
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({
    border = "rounded",
  })
end)

-- show diagnostic infos for current line in float
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true })
