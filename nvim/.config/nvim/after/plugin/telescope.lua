local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local layout_actions = require("telescope.actions.layout")

require('telescope').setup({
    defaults = {
        file_sorter = sorters.get_fzy_sorter,
        prompt_prefix = ">",
        color_devicons = true,

        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        layout_config = {
            horizontal = {
                preview_cutoff = 0,
            },
        },

        mappings = {
            i = {
                ["<C-p>"] = layout_actions.toggle_preview,
                ["<C-q>"] = actions.send_to_qflist,
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
})
