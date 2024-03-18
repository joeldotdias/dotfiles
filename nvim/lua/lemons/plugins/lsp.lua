return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",

        -- Snippets
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
        }
    },

    config = function()
        local lsp = require("lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
                vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>br", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                vim.keymap.set({ "n", "x" }, "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, opts)
            end
        })
        

        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "◍"
                }
            }
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer",
                "gopls",
                "tsserver",
                "clangd",
                "lua_ls",
                "pyright",
                "emmet_language_server",
                "tailwindcss"
            },

            handlers = {
                function(server_name)
                    lsp[server_name].setup({
                        capabilities = capabilities
                    })
                end,

                lsp.ocamllsp.setup({
                    capabilities = capabilities
                }),

                ["tsserver"] = function()
                    lsp.tsserver.setup({
                        settings = {
                            implicitProjectConfiguration = {
                                checkJs = true
                            }
                        },
                        capabilities = capabilities
                    })
                end,

                ["lua_ls"] = function()
                    lsp.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                },
                                workspace = {
                                    checkThirdParty = false
                                }
                            }
                        }
                    })
                end,

                ["tailwindcss"] = function()
                    lsp.tailwindcss.setup({
                        filetypes = { "javascriptreact", "typescriptreact", "svelte", "css", "html" }
                    })
                end
            }
        })


        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done()
        )

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },

            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<Tab>"] = nil,
                ["<S-Tab>"] = nil
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" }
            })
        })

        require("nvim-autopairs").setup({
            disable_filetype = { "rust", "go", "c" }
        })


        vim.diagnostic.config({
            virtual_text = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = ""
            }
        })

        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
    end
}
