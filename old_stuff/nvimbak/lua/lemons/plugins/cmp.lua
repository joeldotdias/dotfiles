return {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },

    opts = {
        keymap = {
            preset = "default",
            ["<CR>"] = { "select_and_accept", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-b>"] = { "scroll_documentation_down" },
            ["<C-f>"] = { "scroll_documentation_up" },
            ["<Tab>"] = {},
            ["<S-Tab>"] = {},
        },

        completion = {
            menu = {
                draw = {
                    padding = { 1, 0 },
                    columns = { { "label", "label_description", gap = 1 }, { "kind" } },
                },
                -- disable cmdline completions
                -- auto_show = function(ctx)
                --     return ctx.mode ~= "cmdline"
                -- end,
            },
            trigger = {
                show_on_insert_on_trigger_character = false,
            },
        },

        snippets = { preset = "luasnip" },
        cmdline = { enabled = false },
        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
            },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
    },

    opts_extend = { "sources.default" },
}
