vim.g.loaded_netrw = 1
vim.g.loaded_ntrwPlugin = 1

require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true,
        }
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
        }
    },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
