local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

ls.add_snippets("c", {
    s(
        "main",
        fmt(
            [[
            int main(int argc, char*argv) {{
                {}
            }}
        ]],
            {
                i(0),
            }
        )
    ),
})
