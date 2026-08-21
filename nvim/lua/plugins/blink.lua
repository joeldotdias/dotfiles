return {
    "saghen/blink.cmp",
    dependencies = {
        "saghen/blink.lib",
        "L3MON4D3/LuaSnip",
    },
    build = function()
        -- require("blink.cmp").build():wait(60000)
        require("blink.cmp").build():pwait()
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "enter",
            ["<Tab>"] = {},
            ["<S-Tab>"] = {},
        },

        completion = {
            documentation = { auto_show = false },
            menu = {
                scrollbar = false,
                draw = {
                    gap = 2,
                    columns = { { "label", "label_description", gap = 1 }, { "kind" } },
                },
            },
        },

        snippets = { preset = "luasnip" },

        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
            },
        },

        cmdline = {
            enabled = false,
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        fuzzy = { implementation = "rust" },
    },
}
