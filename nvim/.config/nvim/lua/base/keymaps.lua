local silent = { silent = true }

vim.g.mapleader = " "

-- Movement between windows with Ctrl-<vim-movement>
vim.keymap.set("n", "<C-h>", "<C-W>h", silent)
vim.keymap.set("n", "<C-j>", "<C-W>j", silent)
vim.keymap.set("n", "<C-l>", "<C-W>l", silent)
vim.keymap.set("n", "<C-k>", "<C-W>k", silent)

-- better half-page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- better search result jumping
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to System Clipboard with leader y
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- resource current file
vim.keymap.set("n", "<leader><leader>x", ":so %<CR>")

-- untoggle higlighting from search
vim.keymap.set("n", "<leader>hl", ":set hlsearch!<CR>")

-- Vertical split
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>")

-- Moving lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Use escape in terminal mode to end insert mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

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
