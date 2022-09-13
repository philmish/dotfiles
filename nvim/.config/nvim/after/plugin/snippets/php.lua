local ls = require "luasnip"
local s = ls.s
local inode = ls.insert_node
local cnode = ls.choice_node
local tnode = ls.text_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(nil, {
    php = {
        s("st", fmt(
            [[
            <?php declare(strict_types=1);

            namespace {};

            {}
            ]],
            { inode(1), inode(0)}
        )),
        s("fc", fmt(
            [[ 
            final class {} {} {} {{
                
                public function __construct({}) {{
                    {}
                }}
            }}
            ]],
            {
                inode(1),
                cnode(2, { tnode"extends", tnode"implements", tnode"" }),
                inode(3),
                inode(4),
                inode(0)
            }
        )),
        s("ac", fmt(
            [[ 
            abstract class {} {{
                {}
            }}
            ]],
            { inode(1), inode(0) }
        )),
        s("tc", fmt(
            [[ 
            use PHPUnit\Framework\TestCase;

            final class {}Test extends TestCase {{

                public function test{}():void {{
                    {}
                }}
            }}
            ]],
            { inode(1), inode(2), inode(0) }
        )),
        s("tf", fmt(
            [[ 
                public function test{}(): void {{
                    {}
                }}
            ]],
            { inode(1), inode(0) }
        )),
        s("pf", fmt(
            [[
                public function {}({}): {} {{
                    {}
                }}
            ]],
            {
                inode(1),
                cnode(2, { tnode"", inode(nil, "params")}),
                cnode(3, { tnode"void", inode(nil, "returns")}),
                inode(0)
            }
        )),
        s("pvf", fmt(
            [[
                private function {}({}): {} {{
                    {}
                }}
            ]],
            {
                inode(1),
                cnode(2, { tnode"", inode(nil, "params")}),
                cnode(3, { tnode"void", inode(nil, "returns")}),
                inode(0)
            }
        )),
        s("prf", fmt(
            [[
                protected function {}({}): {} {{
                    {}
                }}
            ]],
            {
                inode(1),
                cnode(2, { tnode"", inode(nil, "params")}),
                cnode(3, { tnode"void", inode(nil, "returns")}),
                inode(0)
            }
        )),
        s("trc", fmt(
        [[ 
        try {{
            {}
        }} catch ({}) {{
            {}
        }}
        ]],
        {
            inode(2),
            cnode(1, {tnode"Exception $e", inode(nil, "exception") }),
            inode(0)
        }
        )),
    }
})
