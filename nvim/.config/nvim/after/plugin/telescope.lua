local builtin = require("telescope.builtin")

-- File fuzzy find
vim.keymap.set("n", "<leader>pf", builtin.find_files)
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({search = vim.fn.input("> ")})
end)
vim.keymap.set("n", "<leader>pg", builtin.grep_string)

-- Git Stuff
vim.keymap.set("n", "<leader>gf", builtin.git_files)
vim.keymap.set("n", "<leader>gb", builtin.git_branches)
vim.keymap.set("n", "<leader>gc", builtin.git_commits)

-- Vim Help tags
vim.keymap.set("n", "<leader>vh", builtin.help_tags)

-- Diagnostics
vim.keymap.set("n", "<leader>di", "<cmd>Telescope diagnostics<CR>")

-- Navigate references
vim.keymap.set("n", "<leader>rf", builtin.lsp_references)

-- Layout
require("telescope").setup {
    defaults = {
        layout_config = {
            horizontal = {
                preview_cutoff = 0,
           }
        }
    }
}

require("telescope").load_extension("dap")
