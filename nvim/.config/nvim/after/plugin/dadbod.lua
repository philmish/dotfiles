local silent = {silent = true}

vim.keymap.set("n", "<leader>du", ":DBUIToggle<CR>", silent)
vim.keymap.set("n", "<leader>df", ":DBUIFindBuffer<CR>", silent)
vim.keymap.set("n", "<leader>dr", ":DBUIRenameBuffer<CR>", silent)
vim.keymap.set("n", "<leader>dl", ":DBUILastQueryInfo<CR>", silent)
