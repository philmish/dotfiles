"Global settings
set visualbell
set guicursor=
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set relativenumber
set nu
set hidden
set noerrorbells
set incsearch
set scrolloff=8



"Plugins

call plug#begin()

"Colors
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-fugitive'
Plug 'windwp/nvim-autopairs'

"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

"Undotree
Plug 'mbbill/undotree'

"Annotation
Plug 'danymat/neogen'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"harpoon
Plug 'ThePrimeagen/harpoon'

"lualine
Plug 'nvim-lualine/lualine.nvim'

Plug 'renerocksai/calendar-vim'
Plug 'renerocksai/telekasten.nvim'

call plug#end()

colorscheme gruvbox

lua << EOF
require('phil')
EOF

"Keymaps
let mapleader = " "
