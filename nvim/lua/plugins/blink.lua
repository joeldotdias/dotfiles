return {
    "saghen/blink.cmp",
    build = "cargo build --release",
    dependencies = {
        "L3MON4D3/LuaSnip",
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
            },
            trigger = {
                show_on_insert_on_trigger_character = false,
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
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
    },

    opts_extend = { "sources.default" },
    config = function(_, opts)
        require("blink.cmp").setup(opts)
        vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) })
    end,
}
