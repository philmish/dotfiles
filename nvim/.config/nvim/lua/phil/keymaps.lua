-- Make split navigation easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to Window on the left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to Window on the right" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the higher Window" })

-- better half-page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- better search result jumping
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Leave insert mode in terminal with Escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Moving lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader><leader>x", ":so %<CR>")

-- Generate string in uuid4 format at current cursor position
vim.keymap.set("i", "<C-g>", function ()
    local random = math.random
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    local uuid = string.gsub(template, "[xy]", function (c)
        local tmp = (c == "x") and random(0, 0xf) or random(8, 0xb)
        return string.format("%x", tmp)
    end)
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local nline = line:sub(0, pos) .. uuid .. line:sub(pos + 1)
    vim.api.nvim_set_current_line(nline)
end)

-- Open File Explorer
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "[E]xplore files" })

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' }) 
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' }) 
vim.keymap.set('n', '<leader>er', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' }) 
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
