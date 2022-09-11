local ls = require "luasnip"
local s = ls.s
local inode = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(nil, {
    go = {
        s("rer", fmt(
            [[
            if err != nil {{
                return err
            }}
            {}]],
            { inode(0) }
        )),
    }
})
