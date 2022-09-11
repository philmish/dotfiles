local ls = require "luasnip"
local s = ls.s
local inode = ls.insert_node
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
            final class {} extends {} {{
                
                public function __construct({}) {{
                    {}
                }}
            }}
            ]],
            { inode(1), inode(2), inode(3), inode(0) }
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
            use PHPUnit\\Framework\\TestCase;

            final class {}Test extends TestCase {{

                public function test{}():void {{
                    {}
                }}
            }}
            ]],
            { inode(1), inode(2), inode(0) }
        )),
    }
})
