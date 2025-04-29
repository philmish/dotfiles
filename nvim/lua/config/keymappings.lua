vim.keymap.set("n", "<leader>e", ":Explore<CR>", { noremap = true })
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({
    border = "rounded",
  })
end)
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true })
