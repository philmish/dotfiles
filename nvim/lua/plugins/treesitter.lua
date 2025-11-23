return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function ()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c", "lua", "rust", "go", "javascript", "json", "yaml",
          "zig", "helm", "html", "sql", "css", "hcl", "luadoc",
          "make", "nginx", "php", "toml", "terraform", "typescript",
        },
        sync_install = true,
        auto_install = false,
      })
    end,
  },
}
