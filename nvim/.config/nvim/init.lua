vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic Setup which does not require any plugins
require "phil.options"
require "phil.keymaps"
require "phil.disable_builtins"
require "phil.custom_commands"

-- Install packagemanager lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "custom/plugins"})
-- vim: ts=2 sts=2 sw=2 et
