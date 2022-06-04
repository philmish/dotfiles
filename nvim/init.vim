"Global settings

set visualbell
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set relativenumber



"Plugins

call plug#begin()

Plug 'morhetz/gruvbox'
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

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"harpoon
Plug 'ThePrimeagen/harpoon'

call plug#end()

colorscheme gruvbox

lua << EOF
require('phil')
EOF


