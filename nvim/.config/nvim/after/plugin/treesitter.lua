require("nvim-treesitter.configs").setup {
    ensure_installed = {"vimdoc", "php", "c", "go", "rust", "bash", "javascript", "typescript", "lua"},
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}
