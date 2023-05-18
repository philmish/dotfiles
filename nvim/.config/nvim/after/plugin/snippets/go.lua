local ls = require("luasnip")
local snippet = ls.s
local inode = ls.insert_node
local cnode = ls.choice_node
local tnode = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(nil, {
    go = {
        snippet("rer", fmt(
                [[
                if err != nil {{
                    return err
                }}
                {}]],
                {inode(0)}
        )),
        snippet("main", fmt(
                [[
                package main

                func main() {{
                    {}
                }}
                ]],
                {inode(0)}
        )),
    }
})
