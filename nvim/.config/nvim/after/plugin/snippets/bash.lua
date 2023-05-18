local ls = require "luasnip"
local snippet = ls.s
local inode = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(nil, {
    sh = {
        snippet("ifempty", fmt(
                [[
                if [ -z {} ]; then
                    {}
                fi
                ]],
                {inode(1), inode(0)}
        )),
        snippet("bsb", fmt(
                [[
                #!/usr/bin/env bash
                {}
                ]],
                {inode(0)}
        )),
        snippet("swc", fmt(
                [[
                case {} in
                    {})
                        {}
                        ;;
                    *)
                        {}
                    ;;
                esac
                ]],
                {inode(1), inode(2), inode(3), inode(0)}
        )),
    }
})
