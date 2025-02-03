return {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
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
            -- disable cmdline completions
            cmdline = {},
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        -- signature = { enabled = true },
    },

    opts_extend = { "sources.default" },
}

--[[ return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                {
                    { name = "buffer" },
                    { name = "path" },
                },
            }),

            preselect = cmp.PreselectMode.None,

            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<Tab>"] = nil,
                ["<S-Tab>"] = nil,
            }),

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                    -- vim.snippet.expand(args.body) -- native snippets
                end,
            },

            formatting = {
                format = require("nvim-highlight-colors").format,
            },

            window = {
                completion = {
                    border = "rounded",
                    winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
                    scrollbar = true,
                },
            },

            -- experimental = {
            -- 	ghost_text = true,
            -- },
            -- view = {
            --     entries = "wildmenu"
            -- }
            -- window = {
            -- 	completion = cmp.config.window.bordered(),
            -- },
        })
    end,
} ]]
