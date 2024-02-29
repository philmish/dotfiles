vim.opt.relativenumber = true
vim.opt.breakindent = true

vim.opt.signcolumn = "yes"

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.scrolloff = 10

-- Undodir and Undofile
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.inccommand = "split"

vim.opt.hlsearch = true
vim.opt.termguicolors = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

