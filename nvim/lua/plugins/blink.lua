return {
    "saghen/blink.cmp",
    dependencies = {
        "saghen/blink.lib",
        "L3MON4D3/LuaSnip",
    },
    build = "cargo build --release",
    -- build = function()
    --     require("blink.cmp").build():wait(60000)
    -- end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
            ["<CR>"] = { "select_and_accept", "fallback" },
            ["<C-\\>"] = { "hide", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-b>"] = { "scroll_documentation_down", "fallback" },
            ["<C-f>"] = { "scroll_documentation_up", "fallback" },
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
