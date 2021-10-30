-- Plugins


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Colorschemes
  use 'joshdick/onedark.vim'
  use 'bluz71/vim-moonfly-colors'
  use 'morhetz/gruvbox'
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  -- lsp saga
  use 'glepnir/lspsaga.nvim'
  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  -- harpoon
  use 'ThePrimeagen/harpoon'
  -- startify
  use 'mhinz/vim-startify'
  -- vimwiki
  use 'vimwiki/vimwiki'
  -- vim-fugitive
  use 'tpope/vim-fugitive'
  -- vim-test
  use 'vim-test/vim-test'
  -- LSP saga
  use 'glepnir/lspsaga.nvim'
  -- NvimTree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
  use {'konapun/vacuumline.nvim', requires = {
  'glepnir/galaxyline.nvim', branch = 'main',
  'kyazdani42/nvim-web-devicons', opt = true
}, config = function() require('vacuumline').setup() end}
end)


