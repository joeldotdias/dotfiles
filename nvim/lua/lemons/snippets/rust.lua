require("luasnip.session.snippet_collection").clear_snippets("rust")

local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    s(
        "modtest",
        fmt(
            [[
                #[cfg(test)]
                mod test {{
                    use super::*;

                    {}
                }}
            ]],
            {
                i(1),
            }
        )
    ),

    s(
        "test",
        fmt(
            [[
                #[test]
                fn {}() {{
                    {}
                }}
            ]],
            {
                i(1, "test_name"),
                i(0),
            }
        )
    ),
}

