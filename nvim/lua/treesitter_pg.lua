require('nvim-treesitter.configs').setup{
        playground = {
                enable = true,
                disable = {},
                updatetime = 25,
                persist_queries = false,
                keybindings = {
                        toggle_query_editor = 'o',
                        toggle_hl_groups = 'i',
                        toggle_injected_languages = 't',
                        toggle_anonymous_nodes = 'a',
                        toggle_language_display = 'I',
                        focus_language = 'f',
                        unfocus__language = 'F',
                        update = 'R',
                        goto_node = '<cr>',
                        show_help = '?',
                }
        },
        indent = { enable = true },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        textobjects = { enable = true }
}
