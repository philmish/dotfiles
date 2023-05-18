local ls = require("luasnip")
local snippet = ls.s
local inode = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(nil, {
    lua = {
        snippet("lrq", fmt(
                [[
                local {} = require("{}")
                {}
                ]],
                {inode(1), inode(2), inode(0)}
        )),
    }
})
