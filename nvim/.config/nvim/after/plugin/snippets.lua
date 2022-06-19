local ls = require "luasnip"

-- snippets
ls.add_snippets(nil, {
    all = {
        -- available in all filetypes
        ls.parser.parse_snippet("expand", "-- Testing snippets"),
    },
    lua = {
        -- available in lua filetypes
        ls.parser.parse_snippet("lf", "local $1 = function($2)\n  $0\nend"),
    },
})
