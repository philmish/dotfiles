local ls = require "luasnip"
local s = ls.s
local inode = ls.insert_node
local cnode = ls.choice_node
local tnode = ls.text_node
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
        s("strt", fmt(
            [[ 
            type {} struct {{
                {}
            }}
            ]],
            { inode(1), inode(0) }
        )),
        s("fn", fmt(
        [[ 
        func {}({}) ({}) {{
            {}
        }}
        ]],
        { 
            inode(1),
            cnode(2, { inode(nil, "params"), tnode"" }),
            cnode(3, { inode(nil, "returns"), tnode"" }),
            inode(0)
        }
        )),
        s("main", fmt(
        [[ 
        package main

        import (
            "{}"
        )

        func main() {
            {}
        }
        ]],
        { inode(1), inode(0) }
        )),
    }
})
