local global = vim.g
local opt = vim.opt
global.mapleader = " "
global.maplocalleader = "\\"

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

-- Use hybrid line numbers
opt.relativenumber = true
opt.number = true

-- Show matching brackets
opt.showmatch = true

opt.scrolloff = 10
opt.belloff = "all"

opt.signcolumn = "yes"
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true

-- Tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Folding
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldmethod = "expr"
opt.foldlevel = 100
opt.foldenable = true

-- Undo
local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")
opt.undodir = prefix .. ".undo/"
opt.undofile = true
