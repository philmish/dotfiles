return {
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
}
