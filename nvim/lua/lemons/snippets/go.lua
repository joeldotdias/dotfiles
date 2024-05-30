require("luasnip.session.snippet_collection").clear_snippets("go")

local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

return {
    s(
        "grr",
        fmt(
            [[
                if err != nil {{
                    return {}
                }}
                {}
            ]],
            {
                i(1, "err"),
                i(0),
            }
        )
    ),
}
