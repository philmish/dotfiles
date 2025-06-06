---@diagnostic disable: missing-fields
local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "onsails/lspkind-nvim" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lua" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-cmdline" },
    { "L3MON4D3/LuaSnip", version = "2.*", run = "make install_jsregexp" },
    { "petertriho/cmp-git" },
  },
  event = { "InsertEnter", "CmdlineEnter" },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local cmp_git = require("cmp_git")

    cmp_git.setup({
      filetypes = { "gitcommit" },
    })

    cmp.setup({
      formatting = {
        format = lspkind.cmp_format(),
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = false,
        }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "path" },
        { name = "nvim_lua" },
        { name = "buffer", keyword_length = 3 },
        { name = "luasnip" },
        { name = "lazydev", group_index = 0 },
        { name = "git" },
      }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path", keyword_length = 2 },
        { name = "cmdline", keyword_length = 2 },
      }),
    })

    -- luasnip
    local luasnip = require("luasnip")
    luasnip.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })

    local silent = { silent = true }
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      luasnip.expand_or_jump()
    end, silent)
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      luasnip.jump(-1)
    end, silent)
    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end, silent)

    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}

return M
