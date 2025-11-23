local mapkey = vim.keymap.set

-- open file explorer
mapkey("n", "<leader>e", ":Explore<CR>", { noremap = true })

-- open docs for symbol in float
mapkey("n", "K", function()
  vim.lsp.buf.hover({
    border = "rounded",
  })
end)

-- show diagnostic infos for current line in float
mapkey("n", "<leader>d", vim.diagnostic.open_float, { noremap = true })

-- clear search higlighting
mapkey({ "i", "n" }, "<esc>", "<cmd>noh<CR><esc>")

-- resize windows
local opts = { noremap = true, silent = true }
mapkey("n", "<C-S-Up>", "<cmd>resize +5<CR>", opts)
mapkey("n", "<C-S-Down>", "<cmd>resize -5<CR>", opts)
mapkey("n", "<C-S-Left>", "<cmd>vertical resize -5<CR>", opts)
mapkey("n", "<C-S-Right>", "<cmd>vertical resize +5<CR>", opts)

-- source current file
mapkey("n", "<leader><leader>x", "<cmd>source %<CR>", opts)
