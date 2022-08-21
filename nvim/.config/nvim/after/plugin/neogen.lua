-- neogen
require('neogen').setup({
    snippet_engine = "luasnip",
    enabled = true,
    languages = {
        lua = {
            template = {
                annotation_convention = "ldoc",
            }
        },
        python = {
            template = {
                annotation_convention = "google_docstring",
            }
        },
        go = {
            template = {
                annotation_convention = "godoc"
            }
        },
        javascript = {
            template = {
                annotation_convention = "jsdoc",
            }
        },
        php = {
            template = {
                annotation_convention = "phpdoc",
            }
        }
    }
})

