local ls = require("luasnip")
local snippet = ls.s
local inode = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(nil, {
    python = {
        snippet("main", fmt(
                [[
                if __name__ == "__main__":
                    {}
                ]],
                {inode(0)}
        )),
        snippet("sb", fmt(
                [[
                #!/usr/bin/env python3

                {}
                ]],
                {inode(0)}
        ))
    }
})
