vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic Setup which does not require any plugins
require "phil.options"
require "phil.keymaps"

-- Install packagemanager lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  -- [[ 
  -- Plugins requiring little to no setup after installation are
  -- directly imported and configured here.
  --
  -- Plugins requiring more configuration will be imported from
  -- lua/custom/plugins.
  -- ]]
  -- Auto-discover tabstop and shiftwidth
  "tpope/vim-sleuth",
  -- Comment Lines or blocks in visual mode with "gc"
  { "numToStr/Comment.nvim", opts = {} },
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        cmp = true,
        gitsigns = true,
        harpoon = true,
        mason = true,
        native_lsp = true,
        notify = true,
        telescope = true,
        treesitter = true,
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  },
  -- Nice diagnostic viewing and jumping
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  -- Nice highlighting for TODO comments
  {
    "folke/todo-comments.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  -- Preview Markdown files in the browser
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- Custom Plugin configurations found in lua/custom/plugins
  require "custom.plugins.telescope",
  require "custom.plugins.treesitter",
  require "custom.plugins.completion",
  require "custom.plugins.lspconfig",
  require "custom.plugins.mini_nvim",
  require "custom.plugins.lualine",
  require "custom.plugins.harpoon",
}
-- vim: ts=2 sts=2 sw=2 et
